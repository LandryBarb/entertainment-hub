import { prisma } from '~/server/utils/prisma';

export default defineEventHandler(async (event) => {
  const body = await readBody<{
    name: string;
    industry?: string;
    summary?: string;
    userId: string;
  }>(event);

  const brand = await prisma.brand.create({
    data: {
      name: body.name,
      industry: body.industry,
      summary: body.summary,
      userId: body.userId,
    },
  });

  return brand;
});
