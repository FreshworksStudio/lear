"""empty message

Revision ID: a9fcad918698
Revises: 5ad3243edc3e
Create Date: 2019-09-13 11:23:57.766349

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'a9fcad918698'
down_revision = '176f983485c8'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('addresses', sa.Column('office_type', sa.String(length=75), nullable=True))
    op.create_index(op.f('ix_addresses_office_type'), 'addresses', ['office_type'], unique=False)
    op.add_column('addresses_version', sa.Column('office_type', sa.String(length=75), autoincrement=False, nullable=True))
    op.create_index(op.f('ix_addresses_version_office_type'), 'addresses_version', ['office_type'], unique=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_addresses_version_office_type'), table_name='addresses_version')
    op.drop_column('addresses_version', 'office_type')
    op.drop_index(op.f('ix_addresses_office_type'), table_name='addresses')
    op.drop_column('addresses', 'office_type')
    # ### end Alembic commands ###
