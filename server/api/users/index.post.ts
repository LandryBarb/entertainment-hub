import { prisma } from '#imports';

export default defineEventHandler(async (event) => {
  const body = await readBody<{
    email: string;
    name?: string;
    password?: string;
  }>(event);

  // Very simple temporary hash (not secure, just placeholder)
  const passwordHash = body.password ?? 'temp';

  const user = await prisma.user.create({
    data: {
      email: body.email,
      name: body.name ?? null,
      passwordHash,
    },
  });

  return user;
});
