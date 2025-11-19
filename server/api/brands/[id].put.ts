import { prisma } from '~/server/utils/prisma';

export default defineEventHandler(async (event) => {
  const id = event.context.params!.id;
  const body = await readBody(event);

  if (!id) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Brand ID is required',
    });
  }

  const updatedBrand = await prisma.brand.update({
    where: { id },
    data: {
      name: body.name,
      industry: body.industry,
      mission: body.mission,
    },
  });

  return updatedBrand;
});
