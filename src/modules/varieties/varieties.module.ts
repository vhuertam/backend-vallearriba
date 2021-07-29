import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SpeciesRepository } from '../../repository/species.repository';
import { VarietiesRepository } from '../../repository/varieties.repository';
import { VarietiesResolver } from './varieties.resolver';
import { VarietiesService } from './varieties.service';

@Module({
    imports: [
        TypeOrmModule.forFeature([SpeciesRepository, VarietiesRepository]),
    ],
    providers: [VarietiesResolver, VarietiesService]
})

export class VarietiesModule {};