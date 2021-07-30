import { Resolver, Query, Mutation, Args } from '@nestjs/graphql';
import { Estate, EstateData } from '../../graphql.schema';
import { EstatesService } from './estates.service';
import { UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from '../../security/guards/jwt-auth.guard';

@Resolver('Bins')
export class EstatesResolver {
    constructor(
        private readonly estateService: EstatesService
    ) {}
    @Query('getEstates')
    async getEstates(): Promise<Estate[]> {
        return await this.estateService.getEstates();
    }
    @Mutation('createEstate')
    async createEstate(@Args('input') args: EstateData): Promise<Estate> {
        return await this.estateService.createEstate(args);
    }
    @Mutation('deleteEstate')
    async deleteEstate(@Args('id') id: string): Promise<Estate> {
        return await this.estateService.deleteEstate(id);
    }
    @Mutation('editEstate')
    async editEstate(@Args('id') id: string, @Args('input') args: EstateData): Promise<Estate> {
        return await this.estateService.editEstate(id, args);
    }
}