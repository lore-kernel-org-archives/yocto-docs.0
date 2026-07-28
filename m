Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D943C531F9
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 16:40:17 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.604.1785256813399009947
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 09:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=hmrJSuJH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.70.117, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymglBNIxtF7i5/CKuPjlGDl7r15qVJVb/qCNbvS/fYL1lfTSQaTrJ3YL9AAXEHTbQMOSHN1pCcPNR9FbSk1ukDoSKeJWzZ1DszL5//xR5a0XnF8xRCtzk6qlH88kls4DkC0nx9Xg9qz4v3KWbbbzZPRhob4/HAoJV+cLMNs/YGddx119Io2jTjPvxd1uxhUxzlg+woUwDHJhoZkfRzt3N/WJ/wDN7wJn36Wa8P+G6X0VbnD/ZjJvSLA4UmHFGWUjFPmCBEnhgI7XUTpkRvNAYxB6nrTaht8WmIH6N/jvMHOqBnrKBQoCDGXFfkUuFR8eL9jSSt3AxkqmRntTVUueWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhuxwVRFiRJaGBNKnIy/+z/Ng5l+fkhwgiAXcKCjcNQ=;
 b=kU4d1kckzcATSFcGzhKAV3yM7AUcLIJJZ8u0n1hSv+eCG3jwegd69ZGyx+qJ7EeFEYOeLTNbUyd0fMuMaTZt3jbaznhxUlc1KlpdOveIsXpeZLU4Sz/l6FNLnfo5HKTynORb/zCd1VE5Q6NXjicfnTPH0L9RzNZSzLTj21Nnz721H4Uos+msnmTrRhWjfOc0cgxbNEiAbCyQpWkkR5TItOPB5NIQjjWcBkKXXipcLBJZD3LWeZytNHhpy2mu5Zm/AZoCnIhadlCsRUby1Lf101Zv51w9Gpi8ZH9p4XHP922qjNJwh4FiXYe6X4v1BmrxJlysyhXTF4E2qD7GpY39HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhuxwVRFiRJaGBNKnIy/+z/Ng5l+fkhwgiAXcKCjcNQ=;
 b=hmrJSuJHdYdlIA9v//F5k36wb97O2AFCX5dIxWUFimXvhEl6n8x3+2h1T03TkmjShct/fZTxQ7eb/IgcC6o0eyN1Rqb9KCP4j+XZs27cttz8FDSlUzgrZq8fJyMqZrCoqyh66AH7FUcSO2Q0b3Gw4nL+EyrYonebGO+YBHfCuYdWh9NuPcAe/5hol4Izwbi9Yp6p2xdWpit2xwlQMuQI8YMPNCONTEkuf+8YFM5kqcrf1tK+RCSErXBylNTIrsvgbRyWK6uhQe6sD4Ub3ilFNJTOtVmxBYqqBGdJ2WoOZXWOvuzAaQBgeNo4q8mc1RXyI8PRUeidTRIXs3BiwpknaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AM9PR06MB8067.eurprd06.prod.outlook.com (2603:10a6:20b:3ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 16:40:09 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 16:40:09 +0000
Message-ID: <659e38bc-3cb9-453f-919a-40a134bdace4@vaisala.com>
Date: Tue, 28 Jul 2026 19:40:06 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 5/5] tools: Add check-confusables pre-commit
 hook
To: Paul Barker <paul@pbarker.dev>, docs@lists.yoctoproject.org
CC: antonin.godard@bootlin.com, quentin.schulz@cherry.de
References: <20260728090746.27793-1-niko.mauno@vaisala.com>
 <20260728090746.27793-6-niko.mauno@vaisala.com>
 <47257a97161dd37bb8e3204231893fe609cb1040.camel@pbarker.dev>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <47257a97161dd37bb8e3204231893fe609cb1040.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVX0EPF0005F693.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::13c) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AM9PR06MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: a836c276-06ce-4afc-0dec-08deecc6e36a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4143699003|10067099003|6133799003|56012099006|5023799004|11063799006|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CnlQth375FQqdWt1rfesWo+lRaoOVrawz5FGX/dpUqwHAP/A5+Pp3CzljFmc0kl3A3Szhcde6QAxGALs3VrLQk4Bj3xVkv0gwr40+nM7rgJOWOzJd5Rb7uPcIbgpJlHRueL8zhGC1+1aDq7iT9bnmKjzT+ny5QTmHzuNnO2e3eXPw2kXMff/lKsld3bM03dQxH7X6XRwRqUboIpUNqPVcNF19OBfCRNDtEq1EFJArcWT/LFuOc4ziLz3fjGUrkTz4c1lfIdpeCjJuQYfmMyxfNRFQ8a79/0EUogmkazz005EaKQaTW/MY2VPA8mdIVyp06bQxCQ5rft5GI4yJYO1o7l3tpklo5wD9ZcXSGcwOhb/5RdzPCzmmRMgi+Rq1NBxKktQnCVrMyAtKLSN5Q49NaCQ+MpzJgwGYEHpPya73aI/HAQmV8T9C5Eb9K7NGolT1WQ5jF1CHC4FEkDjRFXEI1y1qEMYUYcdae5NoJQ0whN/Er7zWX0PvGWFKrysv+CWlCZeoj6jJGaxizNVxkhxSvOLC1xu/7qOMlPyR1RkOBXFaTSGZzDyfToal0+x9Giik+ibKFsf+LrwDRUpmDJcarjx7gaqugPwPgfkbhns5kNbDfA3nFrCqB5ww0XP5Enr18QUXIRtl2viGfiNr9DA2NP7/sa5jn/UkFqDptIT08s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(10067099003)(6133799003)(56012099006)(5023799004)(11063799006)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a87AwS6HAUZK40qmsZO13tHlOv/FALoQQRZAx/S0PyRPni8QAiW10eu4I9Rs?=
 =?us-ascii?Q?TccttpNrdb2SGvVFPfUVV5Wbi8JIozI5ijLeMIKCO55Bj0/qlUH8acGRjqoS?=
 =?us-ascii?Q?OF0qVyjf9khgTlsZXBm/LnbuNZOiKcFbZTUFNvJ4lr5Z3M65kHYyq2Tyef5W?=
 =?us-ascii?Q?42iTMk5PkfdV5JJbFXxxbcfC/KzrSJY1KUzbtSl8h+dHCTY28FZP2kxpx/ht?=
 =?us-ascii?Q?Nhv71gw0z/ykwS6LRrsy+291mH/3BG8chJrOKr0O5scHJWxVu3hFsNifnaMY?=
 =?us-ascii?Q?Yk3WhgUIPLs33dVCsXG0S3yFGSsnhyfM3HM/G08zWUWRfEspxjq4QeVRB3YS?=
 =?us-ascii?Q?SGsAWdTY9smbweOWLbO+OvvDi1KbpIEdxdKLptPeh0z1BsQ6NQs8gI7Zc8CE?=
 =?us-ascii?Q?Ir1YohvNg6M9xbAjxWXONgse0wiEu8Dl7nLE9KyoluaIz7uWny9wJ/wl2suQ?=
 =?us-ascii?Q?CbKQHBL16XuILKVs+H1q9ErjiFIxCpvam57j/T+YkKEr6eqeCt2s6t8muOL8?=
 =?us-ascii?Q?SE6ffOuVQFS1qo3D1kt5owk666qjp9a0gvKXJFYMHP9mdLTVU3qEHa4UQGby?=
 =?us-ascii?Q?NkEhhUupkJbT9KajFa9sEWbib1pJoDxSNldRYMJpr0k1Wzpur3V6kYkEmt5k?=
 =?us-ascii?Q?653a6PqY//nUQdEDs9WIDfuwOh5OxtCFyGJEJVzl6HW28QHYaJ1VwJKLa3w8?=
 =?us-ascii?Q?3MrUe/f0SLzhLfQNwtZ+rCkvhHusxnSiezHb55RNGeOR7GBCT1KoEknYAFoO?=
 =?us-ascii?Q?mDJuby2DvduQRDAfBYm8wb+0OkhdpnYqRyrnsp6pyh7ZyGTgTsNRAJmA4NpA?=
 =?us-ascii?Q?3BPMbYXlFP+Y6ujLW6nfQ8fluzzTLr8i9aZGb4YDIZAnwVksAHyfYJV1m2HR?=
 =?us-ascii?Q?wmS30kJSp69tSK47hRrs0GHSfQepPt2QRZlHt67yHu6it5DeOhd9kkBupode?=
 =?us-ascii?Q?/DsGWjob4x5W3+fa2LNAqWeeuNrqazvR0PlGcbiCzW2AMfs9wQ5ayTQeICn6?=
 =?us-ascii?Q?fO3rRTlags6UQnvuJ3GwUMZqUyioFk8PnH33YsqhLtjv3SXsHJSmehmrSduY?=
 =?us-ascii?Q?f7bY4tIv6Ywk+oGBmg00PgbDCF+3X7dFIbOIWTd032tnPDWvf94R6dU8QIfg?=
 =?us-ascii?Q?SJgnuqbBJ0ydA1sHIHSWP0I6LPsMc5XLIHg83scS+nYQMNq854mnP4LjGcjW?=
 =?us-ascii?Q?N7CtW5JqOplmfM7X5fnU8YM/VcW2kWnWazkeQei9kOOiCPoCHaHDd+oxGbob?=
 =?us-ascii?Q?Xa2mdsRreeqp77ZPW535gEA3sUtTuMbS3F+RxVSueK+QAeAX/L5r6nNJeqwL?=
 =?us-ascii?Q?w3cDt9Mt/jX9+x7X7Txd4TahmU+C6nb49t13XES+JqQW2CIe4C8a7exOwTMu?=
 =?us-ascii?Q?0D9bs3QTrqf7FxOC2zf0fLEbdl4YfkfrXYsxhNHxrG9V7Z/IiQW1pGCdF7iu?=
 =?us-ascii?Q?r92qPiI71Xg32kvKIVxnbWWoGtti5rRQtUrLGTOGVp2TnMKyPPYdKoXKUgQS?=
 =?us-ascii?Q?QGWzt6zoefuV7GnA0dQuuXhcDo6gMNPT8RF7sFlvjz+eiwaSLM/wviNMg4ZL?=
 =?us-ascii?Q?1GsQWFYd0+XqWFFB5l0y4EgkUl2WSSMlWhf+9VqbSP7K9kaZJ/2hfOoMuO6X?=
 =?us-ascii?Q?UZ4T0goENKDt+tO41uN5xIcAY6Hao/Jl99+oR2b2EM4rWUSZ1A7ySBU3vgkN?=
 =?us-ascii?Q?DKBxj56M1HHz6Gf2jLmDwj709iREHHpRKJ2SBzgL+tCDij6oKxZJqy5GUp1J?=
 =?us-ascii?Q?4QhxpUVcSnDNOf12Mk42348zzDxChTc=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a836c276-06ce-4afc-0dec-08deecc6e36a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 16:40:09.7420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sqm17XVnoFO33PfRJ15C2exI3OSyBmslAo0KBs5fj036AP1RLt6+AU+f2LhnNvUWBd6GNHk2U6WdQukS5xrHGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8067
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 16:40:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10180



On 7/28/26 1:41 PM, Paul Barker wrote:
> On Tue, 2026-07-28 at 12:07 +0300, Niko Mauno via lists.yoctoproject.org
> wrote:
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
>> Wire it up both as a local pre-commit hook, which checks the changed
>> files, and in the Makefile "checks" target, which scans the whole
>> tree, alongside check-glossaries.
>>
>> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
>> Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>=20
> Hi Niko,
>=20
> Are there any existing tools we can use instead of implementing this
> ourselves? Perhaps https://pypi.org/project/confusables/ ?
>=20
> Some comments below if we do want to merge our own implementation of
> this...
>=20

Hi Paul,

Thank you for these observations. It seems that confusables (and its=20
alternatives) would not directly resolve the exact problems that=20
check-confusables script addresses, therefore retained the=20
dependency-free approach in v4 which I just submitted. It addresses the=20
missing copyright/license header, and changes the literal glyphs to \u=20
escape sequences.

Also the topmost commit message now contains a segment explaining why=20
the "own short table" is used instead of depending on a 3rd party package.

-Niko



>> ---
>>   .pre-commit-config.yaml               |   5 ++
>>   documentation/Makefile                |   1 +
>>   documentation/tools/check-confusables | 115 ++++++++++++++++++++++++++
>>   3 files changed, 121 insertions(+)
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
>> index 000000000..d9f27b337
>> --- /dev/null
>> +++ b/documentation/tools/check-confusables
>> @@ -0,0 +1,115 @@
>> +#!/usr/bin/env python3
>> +
>=20
> This needs a copyright and license header.
>=20
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
>> +    "=C2=A0": " ",      # NO-BREAK SPACE
>> +    "=E2=80=AF": " ",      # NARROW NO-BREAK SPACE
>> +    "=E2=80=8B": "",       # ZERO WIDTH SPACE
>> +    "=EF=BB=BF": "",       # ZERO WIDTH NO-BREAK SPACE / BOM
>> +    "=C2=AD": "",       # SOFT HYPHEN
>> +}
>=20
> We should not directly use confusing unicode characters in this array,
> we shoud use '\u' escape sequences.
>=20
> I worry that the above is only a very small subset of the confusable
> characters, and this list will expand over time.
>=20
>> +
>> +NO_BREAK_SPACE =3D "=C2=A0"
>=20
> As above, better to use a '\u' escape sequence here.
>=20
>> +
>> +
>> +def is_box_drawing(char: str) -> bool:
>> +    # Box Drawing Unicode block (U+2500..U+257F), used for the director=
y
>> +    # trees rendered in the manuals.
>> +    return "=E2=94=80" <=3D char <=3D "=E2=95=BF"
>=20
> ... and probably here as well.
>=20
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
> Best regards,
>=20


