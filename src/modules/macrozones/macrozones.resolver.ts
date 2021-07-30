import { Resolver, Mutation, Args, Query } from '@nestjs/graphql';
import { Macrozone, InputMacrozone, InputMacrozoneEdit } from '../../graphql.schema';
import { MacrozonesService } from './macrozones.service';
import { UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from '../../security/guards/jwt-auth.guard';

@Resolver('Macronzes')
export class MacrozoneResolver {
    constructor(
        private readonly macrozonesService: MacrozonesService
    ) {}
    @Mutation('createMacrozone')
    async createMacrozone(@Args('input') args: InputMacrozone): Promise<Macrozone> {
        return await this.macrozonesService.createMacrozone(args);
    }
    @Query('getMacrozones')
    async getMacrozones(): Promise<Macrozone[]> {
        return await this.macrozonesService.getMacrozones();
    }
    @Mutation('deleteMacrozone')
    async deleteMacrozone(@Args('id') id: string): Promise<Macrozone> {
        return await this.macrozonesService.deleteMacrozone(id);
    }
    @Mutation('editMacrozone')
    async editMacrozone(@Args('id') id: string, @Args('input') args: InputMacrozoneEdit ): Promise<Macrozone> {
        return await this.macrozonesService.editMacrozone(id, args);
    }    
}