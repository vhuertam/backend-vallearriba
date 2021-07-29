import { BaseEntity, Column, Entity, PrimaryGeneratedColumn, CreateDateColumn, UpdateDateColumn, DeleteDateColumn } from 'typeorm';

@Entity()
export class Products extends BaseEntity {
    @PrimaryGeneratedColumn('uuid')
    id: string

    @Column({ name: 'id_product', type: 'text', nullable: true })
    idProduct: string

    @Column({ name: 'name', type: 'text', nullable: true })
    name: string

    @Column({ name: 'days', type: 'int', nullable: true })
    days: number

    @CreateDateColumn({ name: 'created_at', type: 'timestamp', default: 'NOW' })
    createdAt: Date

    @UpdateDateColumn({ name: 'updated_at', type: 'timestamp' })
    updatedAt: Date

    @DeleteDateColumn({ name: 'deleted_at', type: 'timestamp' })
    deletedAt: Date
}