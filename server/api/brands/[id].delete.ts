import { prisma } from '~/server/utils/prisma';

export default defineEventHandler(async (event) => {
  const id = event.context.params!.id;

  if (!id) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Brand ID is required',
    });
  }

  const deleted = await prisma.brand.delete({
    where: { id },
  });

  return { success: true, deleted };
});
