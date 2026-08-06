Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6F4C55838
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 06:35:57 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.123])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13987.1785998151784045956
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Aug 2026 23:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=P3Elkn5G;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.162.123, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fm1EvToBDp/Wt5FuiP+SOQUEES3HO21IvFiuoSyd0+WRs3ZyQq9fA3xKVO80Fv5ONN5n5DbzCjhx8we3nayfo20zV0bpaaasLRJKuu0K15RrDSiFYt8NeF5NbA9o6m60ruXytUlhrIp+vWu2DsbEjO+ccMFWB1RKx+CATMkEfExxvHTqo8PXsndxdI4Pr1+4ZKuf0Qo+LNOaei6xNa173a/xqUTWQrN9MKSUqpkZcgA+bWOAAildiu9OOO0NPUTnu1OOcQrjXCBO8odR9cQUT2LFe1d4WTU8cuKWPfSA25F6G8fS6PWY+bGNgELdEfeEPkIKwztUx4oF5MHuDDGhkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcvDFC6FF3c3uKUWI3X3AJlDBrEwsuWHO2QeDuKUYfY=;
 b=SlkJ3Rb/daAbgJDyrw6e3Cnvuk0dSPpx2/DYEtTXezWuxny2Wz2vqYmhjk2oFWIDEUJt3pIuyjhg6WPHWqelPk2JewNFypIlcf3l6n1xRxQlLK8ryTn053OTHGlEbiOL6kfeINjjizRPbfaN7y87bVWyA1l9jE7Ahj/D7W+LbhvhIt2/E2fw708I2aiP6+YaoJ/lizWBkozCxnJIE+xfejOMTMIXxIQCiQ5qIb7sk2yvXk52VCijep7o3ER7FdAsfbV1+sUC2A+CPFGic6P8aQ5LqZqFTL6xM3VCuf2OIFuPFIV1YQDRc1ONZIOgSEyPIX7mgDj2jlHc0vtJTqjHpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcvDFC6FF3c3uKUWI3X3AJlDBrEwsuWHO2QeDuKUYfY=;
 b=P3Elkn5GdguXnmEGQeike5ojr6/3uhlLqwM8otJ1QXxUGXS257NlNDLKkkRx7ey74nS/RStyeEu6m7K/hVaryLAxBsHAzELqXxRqI4XVXXJYz5MOo1wJ6fCgjUJKScckskudSvRZRLsHAnNPMVnHTuUfs1QUl9ivDn1w2PHB8dvueLmz3lS+wjo/jLNdSGgWuQf2X9SCYzItJL1PPT0BBEOtcgEBaz0rl+KpSVXBCqRH+UQnokhAqm1XHMaqaYUD1PkPgPLfCGPCMhukf+Ds4h0+2CW7QFabjWxPJMqfiw0TdaiP5sV2eijVcSoNUy42EZNmjkERpG0qnzj0eh1Jcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by PAWPR06MB8811.eurprd06.prod.outlook.com (2603:10a6:102:388::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 06:35:46 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 06:35:46 +0000
Message-ID: <0a43cc46-6c4d-4ef1-b6b6-ad6672188a89@vaisala.com>
Date: Thu, 6 Aug 2026 09:35:40 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v5 2/2] tools: Add check-confusables pre-commit
 hook
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
CC: paul@pbarker.dev, quentin.schulz@cherry.de
References: <20260803034827.26904-1-niko.mauno@vaisala.com>
 <20260803034827.26904-3-niko.mauno@vaisala.com>
 <DKF62NG8K680.7XCFNJPQIKZJ@bootlin.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <DKF62NG8K680.7XCFNJPQIKZJ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVX0EPF0005F700.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::257) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|PAWPR06MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: d474c419-0331-454a-a6c6-08def384f28b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|56012099006|5023799004|11063799006|10067099003|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	r5AVesZoZRpC0PzHoB8d/rCCmagqV1usKXwRQEbuiKeOtE4Yfj2WevlxLr4OhTlFVPtELYlJAR+pJVBfFHyeT80+3k47sO+z29Uyk2ONjcqk2l4UknyFeknNRgYinV5tklnjhswPp76sVc4dfMcufnWcIfMwc2uEWC46zaQuVts3kMG6eXedGOiblqgnankaEFRH+B4TJoQuzzhwrdOK+WNFbwHNyUlRT2h+A6HA2bKzXcQdT4ZIDuAcNvbaNFAuUZT0vrbL8EeuqvzDujSkk7eHwRPpaSbkyuTiWPtj+i34KO8m+7luYHe2IpOHOopkmVrJupl6QMKU5AF7xhmqqBG7B94VfMvyAFFlJneHrpJzgH7/0UPx/xZwN37nzY/eGpwu/itb3ya3z5KZpTmc4BfXWfTl26v4MI84nL8fd3Sd+yKTdKGuL8OwiB1zzb6FTBtfGXWW2pZg8iWgtUwuTxd8whC6fBgLubqwhLq9swO8XQPUUkG1lL++Nn4n/OpUGWX4Az1LJcHNmpxKcOIbf3lHmxiAkswTfjfNtimz1TR0KevXqQ1TH345M+FEqbHWjQkKAA/5bZ89NRnDviHLwm2KjClZQXbMSX3CXdp4aMf1uaExMc13agG7A2iHT2UJdTtptkpDd2rc9jWbUGl1GMJzz4rFMq+xwCo9p+9vaoc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?STrp9AZzcGvGOYARHUb/AHK/MyU45xx2ixMKBti4upOQuJcCaHauoG8BGWzy?=
 =?us-ascii?Q?cgC3P8OkysWtWr3zFQ1wrnW9hwx4bgVUgLzUgo59XAvPHjk9PuCbCmsTqcTq?=
 =?us-ascii?Q?7N7go/QhxTtueuPHEFkfnKyWmh0x61LAhqZ61EI0QnzZO4Gl0JUyAR1WSng6?=
 =?us-ascii?Q?khthsxaRNuAHxHo3vyk5/whm5vlq8dM4qh0nV4H6VjhfZR3WCDDKujzoiEz/?=
 =?us-ascii?Q?xCu54IhQQvk0QHqeDc307HpJc3iSxC4JX6llnYpIgTfsamIm/HiHuaJWm2aC?=
 =?us-ascii?Q?EiNsc7MT/7SIkIY+7N/gulgjqurD/48NfEJMk85iS3faAKR8e9UV63pi+weZ?=
 =?us-ascii?Q?PFN2R5CN0K6x1t8VhcsPOT4D4d7wIJhcqLUaAlAStGAEiDn2DSLPllDf+o7H?=
 =?us-ascii?Q?czPsJtRfRPXnwWMxfe9eNTjS4KLmKi3QYNbE9Gyr+302gJ6nqagWE4JmWHTV?=
 =?us-ascii?Q?+gV3VyGBdTRGfmBOODqlVW1drLmlkHsVpsSvDgkdDrCyO7j83+Em8hAY/Qvl?=
 =?us-ascii?Q?EoXAMQklTY8rZgCbsrvoEpFX6XMIpWQ66vhGxHxI6YsVU9k5drQ++T7vzdYq?=
 =?us-ascii?Q?cAryXyFQhUSLwG0tL00TjbPmhqucQ54vsOdz9/zZUhxEg3q8ZYY3BsXY0LcC?=
 =?us-ascii?Q?46+nVr+8tKMHQ5C9Z5dOqcXlvIJ/KqWMgdZgllpSNi5AsO9S/eo5rnIJpoPP?=
 =?us-ascii?Q?PPnhfo8J2Rukf2JsPqnNVIKUHmVcf9E4bpSEGfPuNe/bSWVJanipNJvMCSpM?=
 =?us-ascii?Q?yCol/7O4DfbLThPe7v4OqF+wdfR0ZVOrt1B1dXGG6EG0Kg7T5cJJBR0Ph5ZG?=
 =?us-ascii?Q?zUZA42BKftuDk3JTVwy24R4JOOZnavEduDTHPSUUyuXTOUGKO5zA3Me/hJcr?=
 =?us-ascii?Q?fowvTU6saJ/iwt/6ghcsD5JwH8+gRRQf2PQvVTGwD/zk4h5pvNwcD6LAM91E?=
 =?us-ascii?Q?ySIBIk6syzNmDTz11Qm4xrGxdgcwp/mUTRphECR9mvckEoMfDCW1RgnZrgqG?=
 =?us-ascii?Q?IAJMaiQL3v4ItbhDSqt2MCsasnxTQ0B+rWzLecrsyCHKheqfzVhaHIgdsKWA?=
 =?us-ascii?Q?UDI12RNZnrC1/bf/xQunll8PYNeYSAYDBLR8xeSiO3QgZ1hDVnSCOeTVsC2k?=
 =?us-ascii?Q?EjSlsIZjyb4ZUq134sOlyANTr8Xz3eP4fdyV8fZhvypBKqp+CTYdSFl9mp9e?=
 =?us-ascii?Q?KIlQXwjoqpWUnC3YCFgX6htCMXXSqkKK7xGWrhvTn4U61dxVTwT4m+1wJtTP?=
 =?us-ascii?Q?irO8WNfgjoZwU+9utZ+LBJiJXETH42cqKph+ARKKNG7fWlo/VP40y5uOuytT?=
 =?us-ascii?Q?AnIGbiHODgu6ymMSxUvInvQXT/jJyq7F/53L6BZM7PGfFTdkSKFmhRsjC3nU?=
 =?us-ascii?Q?Qmf+YYFBNuxSLYsyaFSQgbeNb2slGW+F5U1TYP8kO4CoFX1VCM21iYdjBVfa?=
 =?us-ascii?Q?fNqZSbMcpjcpNBgCet9vRPmSmNgs9JPRUQr3zO5AER0kdAYq4BM/oFAhuPu5?=
 =?us-ascii?Q?JF+FFEOSNi2h8p+kCkyiJmsncH7HjY1zkM+J0aiFuxwK8rXcWTiZclS4YXYN?=
 =?us-ascii?Q?Tw3gnEqWQkz0FyBz5qT5ajmzDCNHw7gGGaWkUP0XKg5VDOi+NKVYSoCsSw+5?=
 =?us-ascii?Q?/pQdcdM8u5gTxUtDlP2vQcjwKb8haVuUW/K6h4vvtE0i0VQKzkf9hfj7F9Tj?=
 =?us-ascii?Q?2kLV3Ck1wFYxfBcOVz39xsRyQS05B2iE4wqi30+DalOIA3p9ZH62MZG5NLcU?=
 =?us-ascii?Q?riMQMxg6aw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d474c419-0331-454a-a6c6-08def384f28b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 06:35:46.5555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTiF+IITbkTR+0GBsMlZdzR9pgcFwrTU/cOlKuCmjTgm3Q7auLlLJoXGWfzaQkLymjAi3VJ32NJX8pTVDDLujg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB8811
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Aug 2026 06:35:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10237



On 8/3/26 11:30 AM, Antonin Godard wrote:
> Hi,
>=20
> On Mon Aug 3, 2026 at 5:48 AM CEST, Niko Mauno via lists.yoctoproject.org=
 wrote:
>> From: Niko Mauno <niko.mauno@vaisala.com>
>>
>> Add a check-confusables script, in the same fashion as
>> check-glossaries, that scans the documentation .rst sources for
>> non-ASCII "confusable" characters (curly quotes, en/em dashes,
>> non-breaking and zero-width spaces, etc.) and reports each occurrence
>> with its location and suggested ASCII replacement, exiting non-zero if
>> any are found. This guards against the class of breakage fixed in the
>> preceding commit, e.g. curly quotes causing recipe ParseErrors.
>>
>> Legitimate non-ASCII such as box-drawing characters used in directory
>> trees, accented letters in contributor names and CJK characters are
>> intentionally left untouched. No-break spaces are likewise tolerated
>> on lines containing box-drawing characters, since the tree command
>> emits them as indentation in directory listings.
>>
>> The set of flagged characters is intentionally small and curated
>> rather than exhaustive. A general-purpose dependency such as the
>> confusables PyPI package targets Unicode homoglyph detection against
>> the full confusables table; it would also flag the accented names, CJK
>> and box-drawing characters we deliberately keep, so we would still need
>> our own allow-list and replacement policy on top of it. A short,
>> dependency-free table kept in-tree matches check-glossaries and is
>> trivial to extend if a new problematic character shows up.
>>
>> Wire it up both as a local pre-commit hook, which checks the changed
>> files, and in the Makefile "checks" target, which scans the whole
>> tree, alongside check-glossaries.
>>
>> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
>> Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>   .pre-commit-config.yaml               |   5 ++
>>   documentation/Makefile                |   1 +
>>   documentation/tools/check-confusables | 123 ++++++++++++++++++++++++++
>>   3 files changed, 129 insertions(+)
>>   create mode 100755 documentation/tools/check-confusables
>>
>> diff --git a/.pre-commit-config.yaml b/.pre-commit-config.yaml
>> index f2b73a481..876546f9a 100644
>> --- a/.pre-commit-config.yaml
>> +++ b/.pre-commit-config.yaml
>> @@ -6,3 +6,8 @@ repos:
>>           entry: ./documentation/tools/check-glossaries
>>           language: python
>>           pass_filenames: false
>> +      - id: check-confusables
>> +        name: Check for non-ASCII confusable characters
>> +        entry: ./documentation/tools/check-confusables
>> +        language: python
>> +        files: \.rst$
>> diff --git a/documentation/Makefile b/documentation/Makefile
>> index fe0574537..87a6f8a8b 100644
>> --- a/documentation/Makefile
>> +++ b/documentation/Makefile
>> @@ -37,6 +37,7 @@ clean:
>>  =20
>>   checks:
>>   	$(SOURCEDIR)/tools/check-glossaries --docs-dir $(SOURCEDIR)
>> +	$(SOURCEDIR)/tools/check-confusables --docs-dir $(SOURCEDIR)
>>  =20
>>   stylecheck:
>>   	vale sync
>> diff --git a/documentation/tools/check-confusables b/documentation/tools=
/check-confusables
>> new file mode 100755
>> index 000000000..359386e7c
>> --- /dev/null
>> +++ b/documentation/tools/check-confusables
>> @@ -0,0 +1,123 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Check documentation sources for non-ASCII typographic characters that
>> +# should be plain ASCII.
>> +#
>> +# Copyright (c) Vaisala Oyj. All rights reserved.
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +import argparse
>> +import sys
>> +
>> +from pathlib import Path
>> +
>> +
>> +def parse_arguments() -> argparse.Namespace:
>> +    parser =3D argparse.ArgumentParser(
>> +        description=3D"Check documentation sources for non-ASCII typogr=
aphic "
>> +                    "characters that should be plain ASCII")
>> +
>> +    parser.add_argument("files",
>> +                        nargs=3D"*",
>> +                        type=3DPath,
>> +                        help=3D"Specific files to check; if none are gi=
ven, "
>> +                             "all *.rst files under --docs-dir are scan=
ned")
>> +
>> +    parser.add_argument("-d", "--docs-dir",
>> +                        type=3DPath,
>> +                        default=3DPath(__file__).resolve().parent.paren=
t,
>> +                        help=3D"Path to documentation/ directory in yoc=
to-docs")
>> +
>> +    return parser.parse_args()
>> +
>> +
>> +# Map of "confusable" characters that are frequently introduced by edit=
ors,
>> +# word processors or copy-pasting, to their plain ASCII replacement. Th=
ese
>> +# look almost identical to regular ASCII but break tooling, e.g. a curl=
y
>> +# quote in a recipe example causes:
>> +#
>> +#   ERROR: ParseError ...: unparsed line: 'RDEPENDS:${PN} =3D =E2=80=9C=
foo=E2=80=9D'
>> +#
>> +# Only these characters are flagged; legitimate non-ASCII such as box-d=
rawing
>> +# characters used in directory trees, accented letters in contributor n=
ames
>> +# and CJK characters are intentionally left alone.
>> +confusables =3D {
>=20
> Nit, but this is defined in lowercase, but NO_BREAK_SPACE is uppercase, w=
hile
> both are global variables. Maybe make those all uppercase?
>=20
>> +    "\u2018": "'",      # LEFT SINGLE QUOTATION MARK
>> +    "\u2019": "'",      # RIGHT SINGLE QUOTATION MARK
>> +    "\u201c": '"',      # LEFT DOUBLE QUOTATION MARK
>> +    "\u201d": '"',      # RIGHT DOUBLE QUOTATION MARK
>> +    "\u2032": "'",      # PRIME
>> +    "\u2033": '"',      # DOUBLE PRIME
>> +    "\u2013": "-",      # EN DASH
>> +    "\u2014": "--",     # EM DASH
>> +    "\u2010": "-",      # HYPHEN
>> +    "\u2011": "-",      # NON-BREAKING HYPHEN
>> +    "\u2212": "-",      # MINUS SIGN
>> +    "\u00a0": " ",      # NO-BREAK SPACE
>=20
> You could reuse NO_BREAK_SPACE here, if you define it before.
>=20
>> +    "\u202f": " ",      # NARROW NO-BREAK SPACE
>> +    "\u200b": "",       # ZERO WIDTH SPACE
>> +    "\ufeff": "",       # ZERO WIDTH NO-BREAK SPACE / BOM
>> +    "\u00ad": "",       # SOFT HYPHEN
>> +}
>> +
>> +NO_BREAK_SPACE =3D "\u00a0"
>> +
>> +
>> +def is_box_drawing(char: str) -> bool:
>> +    # Box Drawing Unicode block (U+2500..U+257F), used for the director=
y
>> +    # trees rendered in the manuals.
>> +    return "\u2500" <=3D char <=3D "\u257f"
>> +
>> +
>> +def check_file(path: Path, display: str) -> bool:
>> +    found =3D False
>> +
>> +    with open(path, "r", encoding=3D"utf-8") as f:
>> +        for lineno, line in enumerate(f, start=3D1):
>> +            # The tree(1) command indents its directory listings with
>> +            # no-break spaces; such listings are embedded verbatim in t=
he
>> +            # manuals. A no-break space is therefore tolerated on any l=
ine
>> +            # that also contains box-drawing characters (i.e. inside a
>> +            # rendered directory tree), but still flagged elsewhere.
>> +            in_tree =3D any(is_box_drawing(c) for c in line)
>=20
> Not a blocking change, but at this point you could probably continue if i=
n_tree
> is True and move onto the next line. Since we know we're in a box-drawing=
,
> leaving confusables is fine since it's not a command to run?

Thanks Antonin, submitted v6 based on your feedback on other counts,
except the above one:

   =E2=96=8E On skipping the rest of the line when in_tree is true: I kept =
the
   =E2=96=8E narrower per-character rule. The no-break space is the only co=
nfusable
   =E2=96=8E the tree command is known to emit in directory listings, so ex=
empting
   =E2=96=8E the whole line would also stop flagging curly quotes and dashe=
s there,
   =E2=96=8E without a known false positive to justify it. Happy to change =
it if
   =E2=96=8E you would rather have the simpler loop.

-Niko


>=20
>> +            for col, char in enumerate(line, start=3D1):
>> +                if char not in confusables:
>> +                    continue
>> +                if char =3D=3D NO_BREAK_SPACE and in_tree:
>> +                    continue
>> +                replacement =3D confusables[char]
>> +                hint =3D f"'{replacement}'" if replacement else "(remov=
e)"
>> +                print(f"WARNING: {display}:{lineno}:{col}: non-ASCII "
>> +                      f"character U+{ord(char):04X} should be "
>> +                      f"replaced with {hint}")
>> +                found =3D True
>> +
>> +    return found
>> +
>> +
>> +def main():
>> +
>> +    args =3D parse_arguments()
>> +
>> +    # When invoked with explicit files (e.g. by pre-commit, which passe=
s the
>> +    # staged filenames) only those are checked; otherwise the whole tre=
e of
>> +    # *.rst files under --docs-dir is scanned (e.g. by "make checks").
>> +    if args.files:
>> +        targets =3D [(path, str(path)) for path in args.files]
>=20
> Those are Path objects, I don't think you need to store their string
> representation separately to display them? Why not simply passing the Pat=
h
> object when calling print() directly? It should get converted to strings
> directly. And this would make check_file() simpler:
>=20
> def check_file(path: Path) -> bool:
>=20
>      ...
>=20
>      print(f"WARNING: {path}:{lineno}:{col}: non-ASCII "
>            f"character U+{ord(char):04X} should be "
>            f"replaced with {hint}")
>=20
>> +    else:
>> +        docs_dir =3D Path(args.docs_dir)
>> +        targets =3D [(path, str(path.relative_to(docs_dir)))
>> +                   for path in sorted(docs_dir.rglob("*.rst"))]
>> +
>> +    exit_code =3D 0
>> +    for path, display in targets:
>> +        if check_file(path, display):
>> +            exit_code =3D 1
>> +
>> +    sys.exit(exit_code)
>> +
>> +
>> +if __name__ =3D=3D "__main__":
>> +    main()
>=20
> Thanks,
> Antonin


