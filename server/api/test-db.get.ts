import { prisma } from '../utils/prisma';
export default defineEventHandler(async () => {
  try {
    // Just fetch all brands (should be empty if none created)
    const brands = await prisma.brand.findMany();

    return {
      status: 'success',
      message: 'Database connection is working!',
      brands,
    };
  } catch (error: any) {
    return {
      status: 'error',
      message: error.message,
      error,
    };
  }
});
