import { prisma } from '#imports';

export default defineEventHandler(async (event) => {
  const id = getRouterParam(event, 'id')!;

  const brand = await prisma.brand.findUnique({
    where: { id },
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

  if (!brand) {
    throw createError({
      statusCode: 404,
      statusMessage: 'Brand not found',
    });
  }

  return brand;
});
