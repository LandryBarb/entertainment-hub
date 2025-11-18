-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "passwordHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Brand" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "industry" TEXT,
    "summary" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Brand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BrandPositioning" (
    "id" TEXT NOT NULL,
    "brandId" TEXT NOT NULL,
    "purpose" TEXT,
    "promise" TEXT,
    "positioning" TEXT,
    "values" TEXT,
    "personality" TEXT,
    "competitive" TEXT,

    CONSTRAINT "BrandPositioning_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Persona" (
    "id" TEXT NOT NULL,
    "brandId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" TEXT,
    "bio" TEXT,
    "motivations" TEXT,
    "painPoints" TEXT,
    "triggers" TEXT,
    "needs" TEXT,
    "websiteFocus" TEXT,

    CONSTRAINT "Persona_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BrandMessaging" (
    "id" TEXT NOT NULL,
    "brandId" TEXT NOT NULL,
    "coreMessage" TEXT,
    "elevatorPitch" TEXT,
    "taglines" TEXT,
    "valueProps" TEXT,
    "voiceMatrix" TEXT,
    "wordBankGood" TEXT,
    "wordBankBad" TEXT,
    "talkingPoints" TEXT,

    CONSTRAINT "BrandMessaging_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BrandStory" (
    "id" TEXT NOT NULL,
    "brandId" TEXT NOT NULL,
    "origin" TEXT,
    "mission" TEXT,
    "transformation" TEXT,
    "differentiators" TEXT,
    "narrativeArc" TEXT,

    CONSTRAINT "BrandStory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VisualDirection" (
    "id" TEXT NOT NULL,
    "brandId" TEXT NOT NULL,
    "colors" TEXT,
    "typography" TEXT,
    "moodboardUrl" TEXT,
    "layoutNotes" TEXT,
    "styleNotes" TEXT,

    CONSTRAINT "VisualDirection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BrandUX" (
    "id" TEXT NOT NULL,
    "brandId" TEXT NOT NULL,
    "homepageNotes" TEXT,
    "userFlows" TEXT,
    "wireframes" TEXT,
    "ctaStrategy" TEXT,
    "conversionRules" TEXT,

    CONSTRAINT "BrandUX_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SocialDirection" (
    "id" TEXT NOT NULL,
    "brandId" TEXT NOT NULL,
    "pillars" TEXT,
    "voiceGuidelines" TEXT,
    "postFormats" TEXT,
    "carouselGuides" TEXT,
    "consistency" TEXT,

    CONSTRAINT "SocialDirection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FileVault" (
    "id" TEXT NOT NULL,
    "brandId" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "label" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "FileVault_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "BrandPositioning_brandId_key" ON "BrandPositioning"("brandId");

-- CreateIndex
CREATE UNIQUE INDEX "BrandMessaging_brandId_key" ON "BrandMessaging"("brandId");

-- CreateIndex
CREATE UNIQUE INDEX "BrandStory_brandId_key" ON "BrandStory"("brandId");

-- CreateIndex
CREATE UNIQUE INDEX "VisualDirection_brandId_key" ON "VisualDirection"("brandId");

-- CreateIndex
CREATE UNIQUE INDEX "BrandUX_brandId_key" ON "BrandUX"("brandId");

-- CreateIndex
CREATE UNIQUE INDEX "SocialDirection_brandId_key" ON "SocialDirection"("brandId");

-- AddForeignKey
ALTER TABLE "Brand" ADD CONSTRAINT "Brand_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BrandPositioning" ADD CONSTRAINT "BrandPositioning_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "Brand"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Persona" ADD CONSTRAINT "Persona_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "Brand"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BrandMessaging" ADD CONSTRAINT "BrandMessaging_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "Brand"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BrandStory" ADD CONSTRAINT "BrandStory_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "Brand"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VisualDirection" ADD CONSTRAINT "VisualDirection_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "Brand"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BrandUX" ADD CONSTRAINT "BrandUX_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "Brand"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SocialDirection" ADD CONSTRAINT "SocialDirection_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "Brand"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FileVault" ADD CONSTRAINT "FileVault_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "Brand"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
