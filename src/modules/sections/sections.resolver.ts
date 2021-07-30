import { Resolver, Mutation, Args, Query } from '@nestjs/graphql';
import { Section, InputSection, InputSectionEdit } from '../../graphql.schema';
import { SectionsService } from './sections.service';
import { UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from '../../security/guards/jwt-auth.guard';

@Resolver('Sections')
export class SectionsResolver {
    constructor(
        private readonly sectionsService: SectionsService
    ) {}
    @Mutation('createSection')
    async createSection(@Args('input') args: InputSection): Promise<Section> {
        return await this.sectionsService.createSection(args);
    }
    @Query('getSections')
    async getSections(): Promise<Section[]> {
        return await this.sectionsService.getSections();
    }
    @Mutation('deleteSection')
    async deleteSection(@Args('id') id: string): Promise<Section> {
        return await this.sectionsService.deleteSection(id);
    }
    @Mutation('editSection')
    async editSection(@Args('id') id: string, @Args('input') args: InputSectionEdit ): Promise<Section> {
        return await this.sectionsService.editSection(id, args);
    }    
}