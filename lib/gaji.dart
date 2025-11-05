import 'package:flutter/material.dart';

class GajiPage extends StatefulWidget {
	const GajiPage({super.key});

	@override
	State<GajiPage> createState() => _GajiPageState();
}

class _GajiPageState extends State<GajiPage> {
	String? _periode;

	@override
	Widget build(BuildContext context) {
		const topBarColor = Color(0xFFD1DAE9);
		const primaryBlue = Color(0xFF4C5BD9);

		return Scaffold(
			backgroundColor: const Color(0xFFD8E0EF),
			body: SafeArea(
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						// Top bar with logo left and person icon right
						Container(
							height: 56,
							color: topBarColor,
							padding: const EdgeInsets.symmetric(horizontal: 16),
							child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: const [
									_CircleBox(
										child: Image(
											image: AssetImage('lib/assets/logo.png'),
											fit: BoxFit.contain,
										),
									),
									_CircleBox(
										child: Icon(
											Icons.person_outline,
											color: Color(0xFF3F60D9),
										),
									),
								],
							),
						),
						// Back arrow
						Padding(
							padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
							child: IconButton(
								icon: const Icon(Icons.arrow_back),
								onPressed: () => Navigator.of(context).maybePop(),
							),
						),

						// Periode dropdown + download button
						Padding(
							padding: const EdgeInsets.symmetric(horizontal: 16.0),
							child: Row(
								children: [
									Expanded(
										child: Container(
											height: 56,
											padding: const EdgeInsets.symmetric(horizontal: 16),
											decoration: BoxDecoration(
												color: Colors.white,
												borderRadius: BorderRadius.circular(12),
											),
											child: DropdownButtonHideUnderline(
												child: DropdownButton<String>(
													value: _periode,
													hint: const Text(
														'Pilih Periode Gaji',
														style: TextStyle(fontSize: 16),
													),
													icon: const Icon(Icons.expand_more),
													items: const [
														DropdownMenuItem(value: '2025-01', child: Text('Jan 2025')),
														DropdownMenuItem(value: '2025-02', child: Text('Feb 2025')),
														DropdownMenuItem(value: '2025-03', child: Text('Mar 2025')),
													],
													onChanged: (v) => setState(() => _periode = v),
												),
											),
										),
									),
									const SizedBox(width: 16),
									SizedBox(
										height: 56,
										width: 56,
										child: ElevatedButton(
											style: ElevatedButton.styleFrom(
												backgroundColor: primaryBlue,
												shape: RoundedRectangleBorder(
													borderRadius: BorderRadius.circular(12),
												),
												elevation: 0,
											),
											onPressed: () {},
											child: const Icon(Icons.download_outlined, color: Colors.white),
										),
									),
								],
							),
						),

						const SizedBox(height: 20),

						// Table container
						Expanded(
							child: Padding(
								padding: const EdgeInsets.symmetric(horizontal: 16.0),
								child: Container(
									decoration: BoxDecoration(
										color: Colors.white,
										borderRadius: BorderRadius.circular(12),
									),
									padding: const EdgeInsets.all(16),
									child: SingleChildScrollView(
										child: _SlipTable(),
									),
								),
							),
						),
					],
				),
			),
		);
	}
}

class _CircleBox extends StatelessWidget {
	final Widget child;
	const _CircleBox({required this.child});

	@override
	Widget build(BuildContext context) {
		return Container(
			width: 36,
			height: 36,
			decoration: BoxDecoration(
				color: const Color(0xFF5E7AE9).withValues(alpha: 0.25),
				shape: BoxShape.circle,
			),
			padding: const EdgeInsets.all(6),
			child: Center(child: child),
		);
	}
}

class _SlipTable extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		const th = TextStyle(fontWeight: FontWeight.w400, color: Colors.black87);
		const td = TextStyle(color: Colors.black87, fontSize: 11);
		const section = TextStyle(fontWeight: FontWeight.w700, fontSize: 16);
		const totalBold = TextStyle(fontWeight: FontWeight.w700);

		Table header() => Table(
					columnWidths: const {
						0: FixedColumnWidth(36),
						1: FlexColumnWidth(1),
						2: FlexColumnWidth(2),
						3: IntrinsicColumnWidth(),
					},
					defaultVerticalAlignment: TableCellVerticalAlignment.middle,
					children: const [
						TableRow(children: [
							_Cell('No.', style: th),
							_Cell('Kategori', style: th),
							_Cell('Komponen Gaji', style: th),
							_Cell('Jumlah (Rp)', align: TextAlign.right, style: th),
						]),
					],
				);

		Table items(List<List<String>> rows) => Table(
					columnWidths: const {
						0: FixedColumnWidth(36),
						1: FlexColumnWidth(1),
						2: FlexColumnWidth(2),
						3: IntrinsicColumnWidth(),
					},
					defaultVerticalAlignment: TableCellVerticalAlignment.middle,
					children: [
						for (final r in rows)
							TableRow(children: [
								const SizedBox.shrink().withCell(text: r[0], style: td),
								const SizedBox.shrink().withCell(text: r[1], style: td),
								const SizedBox.shrink().withCell(text: r[2], style: td),
								const SizedBox.shrink().withCell(text: r[3], style: td, align: TextAlign.right),
							]),
					],
				);

		Widget fullSpanTitle(String text) => Padding(
					padding: const EdgeInsets.symmetric(vertical: 12),
					child: Text(
						text,
						style: section,
						maxLines: 1,
						overflow: TextOverflow.visible,
						softWrap: false,
					),
				);

		Widget fullSpanTotal(String label, String value) => Padding(
					padding: const EdgeInsets.symmetric(vertical: 8),
					child: Row(
						children: [
							Expanded(
								child: Text(
									label,
									style: totalBold,
									maxLines: 1,
									overflow: TextOverflow.visible,
									softWrap: false,
								),
							),
							Text(
								value,
								style: totalBold,
							),
						],
					),
				);

		Widget spacerH(double h) => SizedBox(height: h);

		return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: [
						header(),
				spacerH(6),
						fullSpanTitle('Penerimaan'),
						items(const [
					['1.', 'PENDAPATAN', 'Gaji Pokok', '5.000.000'],
					['2.', 'PENDAPATAN', 'Tunjangan Jabatan', '800.000'],
					['3.', 'PENDAPATAN', 'Uang Lembur', '200.000'],
				]),
				spacerH(8),
						fullSpanTotal('TOTAL KOTOR', '6.000.000'),
				spacerH(12),
						fullSpanTitle('Potongan'),
						items(const [
					['4.', 'POTONGAN', 'PPh Pasal 21', '120.000'],
					['5.', 'POTONGAN', 'Iuran BPJS', '100.000'],
					['6.', 'POTONGAN', 'Cicilan Karyawan', '50.000'],
				]),
				spacerH(8),
						fullSpanTotal('TOTAL POTONGAN', '270.000'),
				spacerH(8),
						fullSpanTotal('GAJI BERSIH (THP)', '6.230.000'),
			],
		);
	}
}

class _Cell extends StatelessWidget {
	final String text;
	final TextAlign align;
	final TextStyle? style;
	const _Cell(this.text, {this.align = TextAlign.left, this.style});

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.symmetric(vertical: 4.0),
			child: Text(text, textAlign: align, style: style),
		);
	}
}

extension _SizedBoxCell on SizedBox {
	TableCell withCell({required String text, TextStyle? style, TextAlign align = TextAlign.left}) {
		return TableCell(child: _Cell(text, align: align, style: style));
	}
}

