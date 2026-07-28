Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F50EC54F57
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:57 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.142])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.576.1785256727391528194
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 09:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=qm26T04u;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.142, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mU7u8R5hy2oJaVDIwZZlQ0W5CwJSpUt9hzdSINaAWfvTdzdRbTVztb/KqUWa0ta/qb1XbVNY8ItqASkYh1McGJ60EZT8lnkqKywUIAYBuZ+82B7M2IVGn+m9sPn46iyrvkncMl0R2n4ray+/9CUOdnKUj8Mj/XJTI1lcU/zyoBZYS4eakGysLeaEiNqkzR1+d9nhsfpATuEU3fz9yhE7oXe2g9GHF9uc2BDr4bL2XOgSzkn6yDx9hyvgsRzItaimMY/NM2ylUEK9+PAa+ZBP58VOyy8uPYpA0IhvoZKRAssSL4Mxcm5qy2MOX2Z16qOdz6LBCwJi9pL560Lh8Us+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4fgYIxYejkUYu2ldz3xSD3PVFu4/93xHcvlikPEM9o=;
 b=TOu6bNuh0nMBon8jXOjUGE1C8uDf8xAjciwB4Votv6/x4g3MKcAt2JG6jRMshNr2pzEKMGr+zVXfraYpp3bGJVvXytQbX4m4m4K8i0ws154DoSpVuYfHj4UUBf/MhwHExrI59uBSEIwJy2HaBEan8dN13TucAStIaQMffv3z2qZoIITE4wqvni/f0FRX79oqTghkIX4fLigmMBtdFBh5hlzaQmFhxpfRpBDDbrWCDXnNCKokLU+hLnc4uZrgkxhvZRU72PvYt4Lowk7lmo1oRWINmlGmRzaRWIkMJfTxgToDtAHjlWLA8aL6z9F9NCBxnBCgh9LAFzYhqhpLAX7Dkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4fgYIxYejkUYu2ldz3xSD3PVFu4/93xHcvlikPEM9o=;
 b=qm26T04u3EU37WxJs6DQ1hQEGeJ/nt3pqdh0QsIn7qRDqSyjidbpJ7/suu5lDnvmn6Yd9SujfAzimiluOxfBvTr1C2x2xqFAdT5xGx72k0gEGh2orD3GQXLYh+aB+aRPlKkWSzQmPRUXscLU8OW13BaKFynb/MdVagNgGxKkb+GHRrnulnkwbQbL1HE+iG5y94smHrLAJjF3fJQpc/tP4DVDCdrBRaayEgCuKsC+kOspCw/x5ITtENS5oTiS53L2toEI1J5uuFCtLPYiEI7S+0vIPvjhfpl85nlARzfH8a6Inn2nzQ88MHbbA9G1JuM4+VdBAaf2VEbDS8oJk+GfWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AMBPR06MB10211.eurprd06.prod.outlook.com (2603:10a6:20b:6f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 16:38:42 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 16:38:41 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: paul@pbarker.dev,
	antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v4 0/5] documentation: minor fixes, plus a confusables check
Date: Tue, 28 Jul 2026 19:38:01 +0300
Message-ID: <20260728163816.17230-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF000167FB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::675) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AMBPR06MB10211:EE_
X-MS-Office365-Filtering-Correlation-Id: d81668b6-2fee-4c31-8efb-08deecc6af0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|56012099006|11063799006|10067099003|6133799003|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	SbOQPu4ENW34gbXwCro/mqgLRZHRw65f30oef20txvchqPVQNLjbeYhgwrDUnPqrb62M6wG4Cg7YTYM+eyzIIl3DhT+UAxY4ZqKsmI622I6kU6NcpEemX1Ed+qGNECaPk6rJZ3pvufcUJDRq1FR+U6vOwgEAwGTaas3vIxMqzqgfHvuYwVW/O79EXFQuz23L1dLzOyyQulPB7XU5fYD2D7Z/hLMg/xz2VFaL2liHnOzxramzojvzNC6oayfgTj7NUY16Pt5KNIO7TnaNwHenkDdnLJqcY5R71nwXtEzckWTa6/K3Jjm4KBaQpyLrBlT2HyMuaAnOQdHiCRc4GfvxE+fPmTikFCYxzFuCpyJsRKDWPWsdQUdNIJVIRNSO8MVWqsEJnbVYIJXylp169Ym+8VwmdWZDWLxopTfVfwaAwRuyBN7sEif2v91zRToTbHmBumuHuUmmqDFSKRJ1593ej3qn0z02/PB8sA+6r85/0dNUTO8+9ZgWDm0I887pmlhVXogv9o5FLeaNDeDmv7XP0fwiJ06Kv5vr7qatQGMS8vxMri+4A0lQ36xsLv1AZA6fmZWhsTl0hbkQ/2VKhjfwTJ1h+DwbYTxHT4OgxOCMtCOhubKGi95ojK3UEMZjNRFk80ARczstpWTpUrnV0iGht/2oSTsHcFhR4EBhzcnDw1Oe5nfzxuhofDokTTrm3HyxhoyGPIb5XbUDVLTlQwhvaFf7PcWzzcEPoNXgmUq/zxM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n09J37F9h/SmwWgODSr/GEheD2f0seRlWexNhMXdYa9y6x/n6PUC+VWlDk6m?=
 =?us-ascii?Q?VDrtvXAqZTKTrjhR/7LuDaNaRNFGAlagUY+dwSt6jrEJQviwmXsUv80XPAF+?=
 =?us-ascii?Q?w9s9Tx5UGw4SoaNCOdMxKglmCZ40Obk0wZlLuD3DTbfXl9ER430NmIqgHj7y?=
 =?us-ascii?Q?tEVRXNzmOmq3FCcnraJYL0loFdjri+GB8rpptMN9dhev3LuxVyFkEpbwn+5Q?=
 =?us-ascii?Q?pajOwop+U3rg2/wq7ksz5Hn/lxSK0HfezEQvqCyPuIuEPZAvPytZnw3O67B7?=
 =?us-ascii?Q?jVOy7/Iz3yuz85cZ4YItVd943bU2f0iXG8TAzMSId2unQpa9GfEm+O6x0dUa?=
 =?us-ascii?Q?RfRhoHhSShyQ4d25IMpdwUSzh60f9oaW66SrU5C0VGMKBPhejrWUs34/aHC0?=
 =?us-ascii?Q?C0G5L44RrFxN9Y2SXSf0prEkgjGv1CkvjkVZKKCYq+5B0pW7t4ORqPkKGmJz?=
 =?us-ascii?Q?1QD8sRFDRjpqU6SERbR8zrT+159vjIcpDRlijPzFyDtIumEbRVbAOjdIhzXG?=
 =?us-ascii?Q?mZdsX84S65JzyP7Frh7PMo9J1/4qkI2SnWDKXQBZixuogz3NAnNhxIyQOAXV?=
 =?us-ascii?Q?jts5iuek5WQbHlVkCV+HFBypdtIBj5GQnBabtqoaOo0Ew4qTYjmXM4zG3iD5?=
 =?us-ascii?Q?lbpq9aB5n3/w4YSb0FIQxIwyg5jQf9o1aAaLkgLNgCCzTKqLUUaNiRHWzyYZ?=
 =?us-ascii?Q?+FLStRuSmyqU9MUEqh/XL/DSMxnBzEn42fVUbYChTYBOazqf7qI9XWeR1/QJ?=
 =?us-ascii?Q?r77w3R6d53dDM/GdsY4+DWnjb7sAClSapVuuoI6xED7qGH233r8t8zY3U1DW?=
 =?us-ascii?Q?Jwta9kZReQMPSl+H4+P1lf7UBLbYUuhOhGlbsIYllT26rLIfRi1RxujzeY/t?=
 =?us-ascii?Q?at6jGxDrrrf+gDu2pS0uqsLcg3ALFZiMIJPwKj7wsWitjkSLSjqEMI/KEH8o?=
 =?us-ascii?Q?X2HZYtAkmjreGrz/AeAWHZ9oSXztg0qKKXL90iKArJkQeCzKh3znzsXHh5B4?=
 =?us-ascii?Q?f0x/o4d370LQRWeje2jyslGyPCdQtRFNBDqCD4d0DjlI9wfXFoGANw7gkG6b?=
 =?us-ascii?Q?ov2LSJW7rmQY4mINLnC6NLgUAjz1xuLX+zNR9qwnR26cDOu8qWi3OAPo8kOU?=
 =?us-ascii?Q?RXEIMM2Lfe8GXYzgTu9K5IRFF8skDBrGzqtjt7CdHLEGJdg40uExGy70Eo4L?=
 =?us-ascii?Q?DSzjnXCrW7CYyToddgLDyeWN227VNvZlRec1ZKBtUDAiXjOZupfyoTrlX9bx?=
 =?us-ascii?Q?zUVRANRDlJhjgQQdv517UNHqWiqtDAOzBsi1LB7IaA3zIQkurWRClV0zSS+B?=
 =?us-ascii?Q?THFBneyl8ftR+PeprAIXgcMXJ8SMRU0dClmK+9qNnTeTts1vu8XYvOMhQtT1?=
 =?us-ascii?Q?x3wVHw91vWhFugFRZAamZI7Ysos1cm5TxZp0os9+SR7TKxdKzruMcjbeTs4b?=
 =?us-ascii?Q?Ks0w7kydqj1RZhwsZhY855UE4AP1tu3YdCnwgdYEp4gneNh9MbYJXyYe8Z/f?=
 =?us-ascii?Q?HjYkhTQB0HctgG1oIf+hjWI5irTtf5gZwL5WKlWfLXyIF1GXoEGPMiFb6dwz?=
 =?us-ascii?Q?iV9R4Bz/rY9sAm/nXcDpGKce/s3z53gKr5zlAwrOlCznZJGCe6LODPB2Zy0W?=
 =?us-ascii?Q?88eARg7e6A0kUe5am6BZ9ijG3YeC657JLlKVONmdyjpm1hq3/vEQ59EjS+Nf?=
 =?us-ascii?Q?XMWx3UFegfYD6/JG0rjDisKHzI0qHaFjua0mW2Rg8G7RRgO57Xc9GOlTW7E5?=
 =?us-ascii?Q?Kv2WDTBALNR5mYLiyb+XlBSWtPwtgXM=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81668b6-2fee-4c31-8efb-08deecc6af0e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 16:38:41.9138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lunpdj3aqdN2W/KVbwzejO57PnESGYvmaTM0hK8kuJh/4+RK+mpR8cZxvqF4Yf/2++GABDIGMCDMEBz7I3/Sag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR06MB10211
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 16:38:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10174

From: Niko Mauno <niko.mauno@vaisala.com>

A small collection of documentation fixes. Several correct example
snippets that misbehave when copied verbatim; the last two remove
non-ASCII "confusable" characters and add a check to keep them out.

  * ref-manual: add the trailing space missing from :prepend examples,
    so readers don't risk inadvertent string concatenation.
  * ref-manual: drop superfluous spaces from :append examples.
  * dev-manual: add the whitespace around '=3D' that the Whinlatter
    (5.3) recipe parser now warns about.
  * documentation: replace non-ASCII confusables (curly quotes, en/em
    dashes, zero-width spaces, and no-break spaces outside tree output)
    with ASCII; e.g. a curly quote copied into a recipe causes a
    bitbake ParseError. Legitimate non-ASCII (box-drawing in directory
    trees, the no-break spaces the tree command emits there, accented
    contributor names, CJK) is left untouched.
  * tools: add the check-confusables script and wire it up as a
    pre-commit hook and in the Makefile "checks" target, in the same
    fashion as check-glossaries, to guard against regressions.

Changes since v3:
  * Add a copyright and license (MIT) header to the check-confusables
    script (per review feedback).
  * Spell the confusable characters in the map, and the related
    constants, as \u escape sequences rather than literal glyphs, so
    the source itself is unambiguous ASCII (per review feedback).
  * Explain in the commit message why the script carries a short
    curated table of its own instead of depending on a general-purpose
    confusables package: such a package targets the full Unicode
    homoglyph table and would flag the accented names, CJK and
    box-drawing characters we deliberately keep, so an allow-list and
    replacement policy of our own would be needed regardless.

Changes since v2:
  * Keep the no-break spaces that the tree command emits in directory
    listings, and make the check tolerate them on lines containing
    box-drawing characters (per review feedback). No-break spaces in
    prose and command examples are still converted.
  * Make the pre-commit hook pass filenames and check only the changed
    files (per review feedback); the Makefile "checks" target still
    scans the whole tree.
  * Stop treating the horizontal ellipsis as a confusable; the
    truncated git hashes in the release notes are left as-is, as it is
    a cosmetic character rather than a tooling hazard.
  * Add Quentin's Reviewed-by to the three whitespace/operator fixes
    that are unchanged since v1.

Changes since v1:
  * Squashed the two confusable cleanups (recipe-style-guide and
    identify-component) into a single documentation-wide patch and
    extended it to all remaining occurrences.
  * Added the check-confusables tool, pre-commit hook and Makefile
    integration.
  * The three whitespace/operator fixes are unchanged.

Niko Mauno (5):
  ref-manual: Fix occurrences of omitted space with :prepend
  ref-manual: Prune superfluous space with :append
  dev-manual: Fix missing whitespace around '=3D' operator
  documentation: Replace non-ASCII confusable characters with ASCII
  tools: Add check-confusables pre-commit hook

 .pre-commit-config.yaml                       |   5 +
 documentation/Makefile                        |   1 +
 .../contributor-guide/identify-component.rst  |   4 +-
 documentation/contributor-guide/index.rst     |   4 +-
 .../contributor-guide/recipe-style-guide.rst  |   8 +-
 .../contributor-guide/submit-changes.rst      |   4 +-
 documentation/dev-manual/build-quality.rst    |   2 +-
 documentation/dev-manual/debugging.rst        |  14 +-
 documentation/dev-manual/layers.rst           |   2 +-
 documentation/dev-manual/new-recipe.rst       |   4 +-
 documentation/kernel-dev/common.rst           |  10 +-
 .../migration-guides/release-notes-4.1.rst    |   2 +-
 documentation/ref-manual/classes.rst          |   4 +-
 .../ref-manual/devtool-reference.rst          |   4 +-
 documentation/ref-manual/faq.rst              |   6 +-
 documentation/ref-manual/qa-checks.rst        |   2 +-
 documentation/ref-manual/variables.rst        |   5 +-
 .../yocto-project-supported-features.rst      |  10 +-
 .../test-manual/yocto-project-compatible.rst  |   2 +-
 documentation/tools/check-confusables         | 123 ++++++++++++++++++
 .../transitioning-to-a-custom-environment.rst |   2 +-
 documentation/what-i-wish-id-known.rst        |  14 +-
 22 files changed, 182 insertions(+), 50 deletions(-)
 create mode 100755 documentation/tools/check-confusables


base-commit: 358519ca6406a89fee42c45dcaf63a37a374f33c
--=20
2.47.3


