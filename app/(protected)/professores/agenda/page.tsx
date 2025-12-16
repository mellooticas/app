
import { getTurmas } from '@/src/lib/supabase/queries/users_turmas'; // Reuse existing query
import { createClient } from '@/lib/supabase/server';
import { Calendar, Clock, MapPin } from 'lucide-react';
import { redirect } from 'next/navigation';

export default async function ProfessorAgendaPage() {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) redirect('/login');

    const turmas = await getTurmas(user.id);

    // Sort logic or organization by day could be done here
    const days = ['Domingo', 'Segunda', 'Terca', 'Quarta', 'Quinta', 'Sexta', 'Sabado'];

    // Flatten schedule
    const schedule: any[] = [];
    turmas.forEach(t => {
        if (Array.isArray(t.horarios)) {
            t.horarios.forEach((h: any) => {
                schedule.push({
                    day: h.dia,
                    start: h.hora_inicio,
                    end: h.hora_fim,
                    turma: t.nome,
                    sala: t.sala
                });
            });
        }
    });

    // Sort by day index and time
    const dayOrder: any = { 'domingo': 0, 'segunda': 1, 'terca': 2, 'quarta': 3, 'quinta': 4, 'sexta': 5, 'sabado': 6 };
    schedule.sort((a, b) => {
        const dOrder = (dayOrder[a.day.toLowerCase()] || 0) - (dayOrder[b.day.toLowerCase()] || 0);
        if (dOrder !== 0) return dOrder;
        return a.start.localeCompare(b.start);
    });

    return (
        <div className="max-w-4xl mx-auto p-6 md:p-8">
            <h1 className="text-3xl font-bold text-gray-900 mb-8 flex items-center gap-3">
                <Calendar className="w-8 h-8 text-blue-600" />
                Agenda Semanal
            </h1>

            <div className="space-y-6">
                {days.map((dayName) => {
                    const daySlug = dayName.toLowerCase().replace('ç', 'c').replace('ã', 'a'); // simple normalization
                    const dayEvents = schedule.filter(s => s.day.toLowerCase().includes(daySlug) || (daySlug === 'terca' && s.day === 'terca')); // Handle terca/terça

                    if (dayEvents.length === 0) return null;

                    return (
                        <div key={dayName} className="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                            <div className="bg-gray-50 px-6 py-3 border-b border-gray-100">
                                <h3 className="font-bold text-gray-700">{dayName}</h3>
                            </div>
                            <div className="divide-y divide-gray-100">
                                {dayEvents.map((event, idx) => (
                                    <div key={idx} className="p-4 flex items-center justify-between hover:bg-blue-50 transition-colors">
                                        <div className="flex items-center gap-4">
                                            <div className="bg-blue-100 text-blue-700 font-bold px-3 py-1 rounded-lg text-sm">
                                                {event.start}
                                            </div>
                                            <div>
                                                <p className="font-bold text-gray-900">{event.turma}</p>
                                                <p className="text-xs text-gray-500 flex items-center gap-1">
                                                    <Clock size={12} /> {event.start} - {event.end}
                                                </p>
                                            </div>
                                        </div>
                                        <div className="text-sm text-gray-600 flex items-center gap-1 bg-gray-100 px-2 py-1 rounded">
                                            <MapPin size={14} /> {event.sala || 'Sala não deft.'}
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </div>
                    );
                })}

                {schedule.length === 0 && (
                    <div className="text-center py-12 text-gray-500 bg-white rounded-xl border border-dashed">
                        Nenhuma aula fixa agendada encontrada.
                    </div>
                )}
            </div>
        </div>
    );
}
