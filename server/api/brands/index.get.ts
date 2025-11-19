import { prisma } from '~/server/utils/prisma';

export default defineEventHandler(async () => {
  const brands = await prisma.brand.findMany({
    include: {
      positioning: true,
      messaging: true,
      story: true,
      visuals: true,
      ux: true,
      social: true,
      personas: true,
      files: true,
    },
  });
  return brands;
});
