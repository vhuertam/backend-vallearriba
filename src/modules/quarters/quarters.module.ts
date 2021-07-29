import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SectionsRepository } from '../../repository/sections.repository';
import { QuartersRepository } from '../../repository/quarters.repository';
import { QuartersResolver } from './quarters.resolver';
import { QuartersService } from './quarters.service';

@Module({
    imports: [
        TypeOrmModule.forFeature([SectionsRepository, QuartersRepository]),
    ],
    providers: [QuartersResolver, QuartersService]
})

export class QuartersModule {};