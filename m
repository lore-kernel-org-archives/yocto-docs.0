Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BB3C54EFC
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 09:16:27 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.120])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7755.1785230182413116340
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 02:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=uJB9aU5D;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.159.120, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtvsqWGqaf9jqhZc+vUYkcpxPvLzz+iCRiMyye5JLqaaGFCFC7jEXYPdHjee5Ia96OGReu/pcJugEEZNLvmiMhdj7RkKE7i/RQbjvxNtme9fvfu2LRPeEr2/QXhIcRt3ToRqcadWgb9ASxpIr4n7VwGAHRj2I62ZquRbHZrx3Fjl47BIMvTmh5yCdNw/bJeqWiD/uCFexmN46wT2f1unR2ggpKOJx8wkipwO/d/jzen1TYNkpTFVCHF6Li2JHP4Qm812+N0BxGNm6qIaGEpNsPom8yhmdiyHq+kT4bz8XDYpnIgu/hunqcSBzd92jxz4gcytFSgBMo0g8wSIN7weUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzbU2rX8KhJS1QJp6vxSTebTJiX9dnagcaxjZigOHfU=;
 b=q1cuD14x1DKztHLEa8zA56ooMmBGukAybH4gSvjzTX2/0mQ4rJ7UbnYH7w3bsCSHthY2s4SbLeYgb0B45jIlTMYS6xBClQon8J4uwYPrEZZ5lnRUiiuBhMzoT5mcae0uZuW+uFNqHp80TeeVI+jRUHHALk8QCw0nhzTHot6t56a5BkPlSzT6nHaDukWRReQpaH0Qf8CQIxU9oUwzuS2fVu3L8SsfxYhk2TU1DzPKCIuMpYEd1rCekTRpzobhu2T9XKh21lonSPGeneipuofqQP5nunKAYurWZMV0dVQfrU+UgttOrnZddeQIb3Lh0ceh9eWVBYRuf0XQk1r29xd8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzbU2rX8KhJS1QJp6vxSTebTJiX9dnagcaxjZigOHfU=;
 b=uJB9aU5DqVZsFQYeILTXtaNUN8l1m2QQfaO4ZECRhqoknWsx2L6crZZkTJ+IvBP4TDBc16yqpOBsctMSi9D7QpbZBzuL1FgKgDXfPTSe1C5Q9U1CrDQ5M7yHNz5spc4HAz9VQ5yJO9HQZtDKEutoiXjyq9mO5gFA0W01dL7xWVpa0htREBkFGU94a0QY3suSWytSaktmS8QApslL4Gp8PGRgYhbroPcUF0xuPzGrOiO+SAKif9fjYtBCoFOfoyjYRMDDIsOdzr4ZoWRlpDYuIngDjTd+PtVVXyDdwnImHiZT0CzsO2Ln0qrnjGBbOudDa0GWsZYidOR/HcdCbut2jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by GV1PR06MB9320.eurprd06.prod.outlook.com (2603:10a6:150:1ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Tue, 28 Jul
 2026 09:16:17 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 09:16:16 +0000
Message-ID: <9b5d7896-39f4-4404-a315-29e916c6a47b@vaisala.com>
Date: Tue, 28 Jul 2026 12:16:14 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 5/5] tools: Add check-confusables pre-commit
 hook
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de
References: <20260728072328.11926-1-niko.mauno@vaisala.com>
 <20260728072328.11926-6-niko.mauno@vaisala.com>
 <DKA1IJIDVAHQ.324SKDQV530OU@bootlin.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <DKA1IJIDVAHQ.324SKDQV530OU@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF0002397C.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::37b) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|GV1PR06MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2c9dce-6bc8-4dbe-44e2-08deec88e0e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|10067099003|11063799006|4143699003|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	lzk+/kgdxkxYgKpzpOMV6D9bT1n1CFmwCXUGgzRLTEFXlaqevWrZtsFKOtw8XDkxHvXFfwqAceTf+9UkCarAojQkRq2MqpjLkzqO0mDCcm0Fmj1zwKIepdMhRFUWHRRDAUl3weyH/E6brBTaWFTcahOtzr3txMgvpBcUeo8svZsVeLg/YL5h+nb0YRfDYLhoJRboQodvzXzXVf4bM8qDF//YmZrep2ijVktnAfJish4PNMiXmkSek7v5mVYuAkxLvu5lo4S8p6SBGhyrWDihgciqpi5mX6cFkUK4zZ7NXLTNeeWonFOexsuOtbWo2ZBaShXizZlR2S29M6NrUbhuUcDApVwH2KitCAA8q7p3TRhB/xo4zaw2aGGMhUXBALO1g9gT3SWTLDcBHJj8gDTb8HpIjxmiTEnPInqSjG9CqPnyNvxDUHMmvaGWHU+lpE6ErrBCOhtWiPkd3WT3vwuei/8xAIevFy02o+TBZAzYEGcnk+N5Oq6fnlJALwQOjrTmlXGClg8Gq1XYSD6cKHcSzeSUY82H056ncDyrZvzp6wZvBynwpAVIfl3cOtDSTrgUZ12kAaV6rigYdCsDxtJAgHPnHe6/To/xLBQIhQ9Kt5yftC2F7aaa4Ck94F+YgPnp6YY4jN1Hdf1G56mGYBL9VoWuEd+HS7f65wE+q05sCAs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5tTSh5adrZ5Dz0VDOTdUSjpssRK00Jt0DDv1xpe5UFMi302atQPYv/H/TOBo?=
 =?us-ascii?Q?SBfqgqN0lwnmFk4taizQE7qjvXleAnzQvCb/HZQdv45V0pk0N5kWwYB6kqHP?=
 =?us-ascii?Q?FYQanGA/um0w7eq+sU46Dyus0EjoXNzOh/t8LVSzEJqrHz3aYBgHogIofucl?=
 =?us-ascii?Q?S4q1PJwnwCibMDGvL5XIcsmH9U64OohO9Suzq/Zhzf+45rufgDRbrNy9xUZv?=
 =?us-ascii?Q?ffl/p50L27+NRVQvv6wxkxZY/pYItGx943gvCcpIHSFkxDlsUq4gjNDj9wUF?=
 =?us-ascii?Q?q3MGDXEkS7OwLpPRKwZjQ1Yxsk4kyDnkJfy1By5AtxZNiFDk+x83b1gC4Wte?=
 =?us-ascii?Q?Wy73IElk7HPaZWlzXYWD03ec3PShXeaN407xZ6uJeEmZJ4Wu2aP18ltT3yVd?=
 =?us-ascii?Q?Ru1GHkoHTv3nmEwf1VSQZNyn5nHwl3v4kSjVL2xm1gqskhtQOIlge1Evp305?=
 =?us-ascii?Q?/XJKwG4Nsd5xVg23z1m7MWMzCw/jI/ROPJ32HArDV17sskMMg4WtaXNcZaS0?=
 =?us-ascii?Q?heQQy4gU8MYzxn8iqX2+L4hzdmKbxrhNHBY9ATLZVmUxLrUYdZ67of0FuKPl?=
 =?us-ascii?Q?KK0siyvgwVzKerSnvBC81WSjjmBf479ej5mEI9cx576tH6SeMK1iD+Kfn1iK?=
 =?us-ascii?Q?+7xvmS4w9eOP872A2dixKpWro8hxMuVlLMC+Ie0K+KMXt9me9+HJA1wYEoez?=
 =?us-ascii?Q?UfzhzyFAdC7WgVTOKRamO57RM8yTDp8CWKy681CAhpSrpq3mpld3GZWT1sIZ?=
 =?us-ascii?Q?md85qU0jVbWokYbhxQNpjHf6B3qvpRxTA8vn11UUjfU8Nurwkuw9l36l/C9a?=
 =?us-ascii?Q?YTk2O6oiT5hl1eNkBIt/qGXMa5xFyjrts32Hcuz+GyZRd3gQKONNoYKPyOvz?=
 =?us-ascii?Q?tjCRQQesVDC8gXV0Xr3kjOHGAGCngZOJ2ZfP9sJQuUBu4XqIjfCput95CeQz?=
 =?us-ascii?Q?iWPA6H0UrtbEq8KV7VGMASXMaWfuxR2NmnKB5yML3PARyv0i01/0i1AUCAlo?=
 =?us-ascii?Q?Kq7b7er8C0jqgcy+9CJGF6lfQZlBiYof8NWLE/4WWuLSwpfuFvsIjelAiF5y?=
 =?us-ascii?Q?FK1/rl0j55HY+8gMR5H5wO5PIgxh+4ocxtw7UB3AJfUxd/CKBRj7+EkTSA0Y?=
 =?us-ascii?Q?r/bJmF2LaSy8ld4jeoaWkJz1URwDPsZqMQFJR+fhCUf8j3VVK8MI0mqEhdlJ?=
 =?us-ascii?Q?aC+gcHjQj/PG6UgezHNVxyntlOr2TMFT0sCJQgEtIB6EDA7fPLECf2b+la8Y?=
 =?us-ascii?Q?40j6LHYvMgRdASd0g0bqHghUKNOUswb56dV/WQJ9E8yl3eAt/iG56Pp81A8a?=
 =?us-ascii?Q?K6ELCmdV6KKhI7RX/Lem4+6Vui26LhBYP2mRXkfjldmHNQa5yU8THVs6oUK+?=
 =?us-ascii?Q?fV+lxwcIHNpN+f0dnqJrxUyuHM/scN7TMRlKlV/rXVzCp5WyUxG4SfTqY+LF?=
 =?us-ascii?Q?bKZ2+tpTT1RCkmPhrbVRtHgqoABfg+IwF1Zy7UyaG7th+As/AyrNoIqcsf9y?=
 =?us-ascii?Q?LvqNEEb040nDnzGgQf4TScs/fd2JmX4NbKhgQIgYK1Nxk2vvzsi58lM9YnuB?=
 =?us-ascii?Q?KogfgWSZoNbhMATCtVh2I7pK/q88ZTu3japXlaSlCALwmtuJD4IlD05Ck+W1?=
 =?us-ascii?Q?efQsEvt597dwn3kg+yDC7Wv5XOmR5+bGBuvrJWJwjN4y+wiG29i4j1x7xmSd?=
 =?us-ascii?Q?eneU0F6+HXM0kdgk59WyhYRlqVxz4D9+I7vvnlmpUlW1XDsfb1+QxoFcHJlo?=
 =?us-ascii?Q?BtAKZL4yA0sUX6iv/Zg2xF+CQ+dOGUM=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2c9dce-6bc8-4dbe-44e2-08deec88e0e7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:16:16.7404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jkJPLAgkRvY7bp0WanMuGLhS64KK9QQL8Nmif3npbtGBHlObOFprTjcOBPYqaA3vejdUkvpkO5KppOIbwRvpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9320
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 09:16:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10172



On 7/28/26 10:53 AM, Antonin Godard wrote:
> Hi,
>=20
> On Tue Jul 28, 2026 at 9:23 AM CEST, Niko Mauno via lists.yoctoproject.or=
g wrote:
>> From: Niko Mauno <niko.mauno@vaisala.com>
>>
>> Add a check-confusables script, in the same fashion as
>> check-glossaries, that scans the documentation .rst sources for
>> non-ASCII "confusable" characters (curly quotes, en/em dashes,
>> horizontal ellipsis, non-breaking and zero-width spaces, etc.) and
>> reports each occurrence with its location and suggested ASCII
>> replacement, exiting non-zero if any are found. This guards against
>> the class of breakage fixed in the preceding commit, e.g. curly quotes
>> causing recipe ParseErrors.
>>
>> Legitimate non-ASCII such as box-drawing characters used in directory
>> trees, accented letters in contributor names and CJK characters are
>> intentionally left untouched.
>>
>> Wire it up both as a local pre-commit hook and in the Makefile "checks"
>> target, alongside check-glossaries.
>>
>> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
>> Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>   .pre-commit-config.yaml               |  5 ++
>>   documentation/Makefile                |  1 +
>>   documentation/tools/check-confusables | 77 +++++++++++++++++++++++++++
>>   3 files changed, 83 insertions(+)
>>   create mode 100755 documentation/tools/check-confusables
>>
>> diff --git a/.pre-commit-config.yaml b/.pre-commit-config.yaml
>> index f2b73a481..d6008b609 100644
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
>> +        pass_filenames: false
>=20
> I think we should pass filenames and check only the modified files, no ne=
ed to
> checking the entire tree each time?
>=20
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
>> index 000000000..f79ee046c
>> --- /dev/null
>> +++ b/documentation/tools/check-confusables
>> @@ -0,0 +1,77 @@
>> +#!/usr/bin/env python3
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
>> +#   ERROR: ParseError ...: unparsed line: 'RDEPENDS:${PN} =3D "foo"'
>=20
> I don't see the curly quote here
>=20
>> +#
>> +# Only these characters are flagged; legitimate non-ASCII such as box-d=
rawing
>> +# characters used in directory trees, accented letters in contributor n=
ames
>> +# and CJK characters are intentionally left alone.
>> +confusables =3D {
>> +    "=E2=80=98": "'",      # LEFT SINGLE QUOTATION MARK
>> +    "=E2=80=99": "'",      # RIGHT SINGLE QUOTATION MARK
>> +    "=E2=80=9C": '"',      # LEFT DOUBLE QUOTATION MARK
>> +    "=E2=80=9D": '"',      # RIGHT DOUBLE QUOTATION MARK
>> +    "=E2=80=B2": "'",      # PRIME
>> +    "=E2=80=B3": '"',      # DOUBLE PRIME
>> +    "=E2=80=93": "-",      # EN DASH
>> +    "=E2=80=94": "--",     # EM DASH
>> +    "=E2=80=90": "-",      # HYPHEN
>> +    "=E2=80=91": "-",      # NON-BREAKING HYPHEN
>> +    "=E2=88=92": "-",      # MINUS SIGN
>> +    "=E2=80=A6": "...",    # HORIZONTAL ELLIPSIS
>> +    "=C2=A0": " ",      # NO-BREAK SPACE
>=20
> Actually, since the `tree` command uses no-break spaces, I think it's OK =
to keep
> them otherwise we'd have to convert each tree output, which also might be
> confusing.
>=20
>> +    "=E2=80=AF": " ",      # NARROW NO-BREAK SPACE
>> +    "=E2=80=8B": "",       # ZERO WIDTH SPACE
>> +    "=EF=BB=BF": "",       # ZERO WIDTH NO-BREAK SPACE / BOM
>> +    "=C2=AD": "",       # SOFT HYPHEN
>> +}
>> +
>> +
>> +def main():
>> +
>> +    args =3D parse_arguments()
>> +    exit_code =3D 0
>> +
>> +    for rst_path in sorted(Path(args.docs_dir).rglob("*.rst")):
>> +        rel =3D rst_path.relative_to(args.docs_dir)
>> +
>> +        with open(rst_path, "r", encoding=3D"utf-8") as f:
>> +            for lineno, line in enumerate(f, start=3D1):
>> +                for col, char in enumerate(line, start=3D1):
>> +                    if char in confusables:
>> +                        replacement =3D confusables[char]
>> +                        hint =3D (f"'{replacement}'" if replacement
>> +                                else "(remove)")
>> +                        print(f"WARNING: {rel}:{lineno}:{col}: non-ASCI=
I "
>> +                              f"character U+{ord(char):04X} should be "
>> +                              f"replaced with {hint}")
>> +                        exit_code =3D 1
>> +
>> +    sys.exit(exit_code)
>> +
>> +
>> +if __name__ =3D=3D "__main__":
>> +    main()
>=20
>=20
> Antonin


Thank You Antonin, I have now submitted v3 which should address the=20
observations You pointed out above, plus adds Quentin's Reviewed-by line=20
in the bottom three commits which remained unchanged since v1, and also=20
leaves out conversion of "horizontal ellipsis" characters which seemed=20
to be used for denoting git hash truncation and therefore seemed to add=20
just noise to the fix commit.
-Niko

