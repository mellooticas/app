// src/hooks/index.ts
// Barrel exports para todos os hooks customizados

// Auth hooks
export {
  useCurrentUser,
  useCurrentSession,
  useSignIn,
  useSignUp,
  useSignOut,
  useCurrentProfile,
  useUpdateProfile,
  useIsAuthenticated
} from './useAuth';

// Achievements hooks
export {
  useUserAchievements,
  useUserPoints,
  useAchievementsByType,
  useAddAchievement,
  useHasAchievement,
  useGamificationStats
} from './useAchievements';

// Alpha Desafios hooks
export {
  useActiveDesafios,
  useDesafio,
  useDesafiosByNivel,
  useCreateDesafio,
  useUpdateDesafio,
  useDeactivateDesafio,
  useDesafiosByDifficulty,
  useDesafiosStats
} from './useAlphaDesafios';

// Portfolio hooks
export {
  useUserPortfolios,
  usePortfolio,
  usePublicPortfolios,
  usePortfoliosByType,
  useCreatePortfolio,
  useUpdatePortfolio,
  useDeletePortfolio,
  usePortfolioStats
} from './usePortfolio';
