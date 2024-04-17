Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F99C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 08:48:41 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.93])
 by mx.groups.io with SMTP id smtpd.web11.8120.1713343720395742221
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 01:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=bQnUz4Jy;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.105.93, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsrFDC91M1+xWajB2h/wdgXtU+gG7IR/zwZwluMGKnu3pXs15JP7CCmU/8crZR34BUcI9m2E92u2zB7NCR2B8+Gn8iJy8wBz79grYnW7ATAhd2ggB2ZiIus1ABwTGYr4gy5XwAdoUTzNnH8Bbq2RLpPM6HPESbxYSU4Ynbtm0XflVhRdKO2g0PsvAc4Obk41uilOvvEWQj74icsrNlMpA1VHAslJAqaROjTmHbExBz7f/4uMV/kGvtIwzKkf7U7ZGlUAYcliaEbrzner+OK2IpwDXZKplNAyxkLfwmRUA8RLZY/NJEiQKNKToCdvQD3Ky6Ta+nQdJioLZto81TaIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSVCg9HIubXl+EiDQ9X42nOPDOwLVuHf5kpz5GG/b5g=;
 b=TLZ8xU9upqQF0hfgvvU4KIwPLetB2P0o+Q2P8dnsnRSYHMZ812pLipHA8VZooLsA2JW5OPmGmKXeOS8wsFBlDk/YaogWlGbL5YmnsTN7iQn2ssRm0My+aCD3N3umxRzGY+VprZOfEs8HVGVzIXnEhu6uwWVkfiu0NnLcsT91uWp6KRreEhrZLtoRsn7xqxx1JjTlpHWNjnb4Ep/Tl2heXJwiPNjoV5q2MG/PWsizyOWWdgSdO1ojbd4JOh2JN0h8pXMZ1JuNsVdImgB92FkEK+jw8ksyer2R64RlX0k73fJsKj6FAt4b/ZOY4Yn3ZsR/foGZwL8/r4hEKosBsg87hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSVCg9HIubXl+EiDQ9X42nOPDOwLVuHf5kpz5GG/b5g=;
 b=bQnUz4JyXivcKrTPW1lr8qGSKtAIR873v3w+e7hcvr5z5NfqhMahTo/P4Av1bWq8vQkRts3aODloGPb2DkhYAXsK1dvC/E8UZW2sZIomEY0lfzRmtpyvuPXHK5o5XDv7hDnZci0q968f9rBCpsc1ortmLwW+jKDEVJ9+lOGYfruvbN+a43wiqEb0WQBlckm2e+7kCZ20eGETYgoRAgjglqr2WXJByd7F5SHIXXoljnn1zAmch5xI0kG5IywLki2P3juhckRKPyYJII9fux6+wH4jWto8GHM+2QWHrVbhutcSvurXUj3QnX14ZUnXULdGCXqAveGrTLILjhw29Bnfrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by DUZPR04MB9793.eurprd04.prod.outlook.com (2603:10a6:10:4b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 08:48:36 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::bdc7:4b2c:e74e:1504]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::bdc7:4b2c:e74e:1504%7]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 08:48:36 +0000
Message-ID: <f75050ee-83eb-4edc-910c-005cbcabc480@theobroma-systems.com>
Date: Wed, 17 Apr 2024 10:48:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] manuals: standards.md5: add standard for project names
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20240417070703.3883433-1-michael.opdenacker@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240417070703.3883433-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|DUZPR04MB9793:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f81796-1fb4-4af4-8662-08dc5ebb2ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uhAkrbEPIupj+1OpbpwfFfsTBwljg+kbDmTDEPw5IpAKnfk1BnN4ZI2hcREpSNvfR33D/DwOWuVTlRQUcLvzOOZ1xqKsI5uhA58K1RUzTjr6OwxPw4DN7zATyksEex7wV7uwrAgw/nisQ/rKcfNiLcchDB8JaE+ljWcZ31ld5Zi2mK7NII6IV7+0jJ6sTl8BDvNBm+3mhHWKvypZf+IGYyrYsS3zuPj1eJs7eeKzIt2LVk7u9PgnQmjDWtNtzJkzwcJf1p+qPEcFGPAPPTl6Vlz++vQw1IppcRDmURL1/vDeHQJlcR8mMRTY2KJRxcdW7QYm3zg5Ynw9/LIxB6C6qvBNuz3uYkFYasUY3uR2l2Auc2dqWqm/gLxut9IBQAFyrgrh0yM/+kd8i2FZWFBNr7Glk7wrgMSLtws77VI/xikxznfLVu48hMq1MpEqxhJQ7LDeTbn/pVvTnZe0Ut58dbFBjHvvgO37yqzTxcFIF5rYU7y7RXJ244yiCQvGJXvb2sblFSawJZowlfPdB7zGWEyRY7WwQFd0wlSLzPTaT1RnWwupCA2nK8Tz5o4MrbE26E2LdJKIof1PfT5Zqo4gBmhloFJXcSDVtazF+dw9zr0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4842.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wm9sZVhDQjV3TGtSOFlGM0k1eGhWS0ZVcWxDSVdQdWJvNmFtY3RIYUFHTXpF?=
 =?utf-8?B?T3RuVGI3NmM2cTJMbzdBVlUvSlV3ZGpMaHh0bThaVGk3dVQvUDVBTFIycW9m?=
 =?utf-8?B?dEh0Sm53bFBVYkQ5MzUyTWo4YWZ5RnNrc09MUXJvbzhEcFB2V1h4ZlBDVlhX?=
 =?utf-8?B?WEZuRkhMVmxiNE5xYUZla1BiNDR4Nzc1T2EzT0dkT0hieG0xbHN1Sm9NRHlD?=
 =?utf-8?B?a3NUdUVxVmV4d2FJSXg5UVBpNDRpVjhJWlMzVjZ6aDcxRldWVVNXY2FPNTdu?=
 =?utf-8?B?K2tQWWkzNEd2YVU0UGNnblpBRWY3MFBWUGVZTmJMdHNzcGI1QytmUFdPb0g3?=
 =?utf-8?B?UnNSM045N0pVRnozbkJZSzY2b0pGeWIwYWlYUWVVQWZCeUdDWWNUcTArUHZY?=
 =?utf-8?B?RDk1Q21FOTV1SWhDNWRJNnNOYkozbkw0QXFiRHl0ZE51d0x0MXZlZXZtTUdD?=
 =?utf-8?B?OFoxdnVobkpnRXF0aWpVd1dQcTljZ0h1WWFxWlkyQWg0enRxcm9IbzBnYzNq?=
 =?utf-8?B?a3NGYUNGeUM2ODRUZ2hTclpZQWhnYlBJMGNqRjdJYmsvY2NJeFR6VkxxY1U4?=
 =?utf-8?B?UDBoU2tEY0t3eC9sL01GWEZWaE5vZ09CSENDMGNCUWtqQXlVT2pVTmlySUhr?=
 =?utf-8?B?cXI3SVdxamFJRm9DVEpab3lvdUt0NTh3d3JuMERpRmhrMW1JM2YxMm9aclZM?=
 =?utf-8?B?eUROeEF2U1hjZ3FXbFQ1Y0dTTWhqVFdLU0Z1cFllS2dZMXErVjV1MjFGQ2lu?=
 =?utf-8?B?T2lIamhOL01JQk1rNHZYSkdHeS82cmZCRHFrUnpwMUl4NEhTbW01WVJ5b0Va?=
 =?utf-8?B?V1dndXVoV0ZDTE9KQVcxdHpTdkJvSi93NTdPYVp0Z05tbGZGMmZIdjNBYnlz?=
 =?utf-8?B?V1J2bHdmZk9vc3pDR016S0ljQ0dCRVpGcTk4d0ExdDl0aTNBMUNzcTQzUmtO?=
 =?utf-8?B?YjVtVUNQbFZuL0t2MUdVRmF3OC9ML3FiVzVjRmRQVXdPcDhjY1hNZW12RFU3?=
 =?utf-8?B?SmVpZGlPVGR4WFJ3aVlGMEVPM25qUW16RzNsRDBmaXY2eWNJSHhJaHpBWGlW?=
 =?utf-8?B?T21tTkNRcSs5YjlySUtDWDdCODliaytYL0hiZWh6YjhaVFFCUkxpTURTNE9J?=
 =?utf-8?B?L0xuVlhjak5STVhXeEhpekx4c0FXTC9lZG1HYmsySE8rZm52VHFLdWI1OHl6?=
 =?utf-8?B?S3hRYWZKWEU5WUFsSHk4dTJkVzdwOWk3ZzBBU1NmYkd6dmFoekZjOFoxVmdR?=
 =?utf-8?B?STNDS3FUYUszQzUyNEF6eGg1ejhEaEI5ZEZlM0tuWVhJUlEvd01KUVVGQklh?=
 =?utf-8?B?ejBva3BjTGZkTHk4UnRwcklZdjFSTm9qUFVIaEgyb2syZU4xZDl2ck5JWng0?=
 =?utf-8?B?a2tpYzFjUSs3VXhGUzJRMUhEMGI4bUsrcnMxekF2VXVtRlFTMFRySW15TG5r?=
 =?utf-8?B?N2pNbnpaTVp4TkJ1elZDUUNXUlJJeHUvWXd4Z3lIcmwzRmNmbzBCMkFCUUNL?=
 =?utf-8?B?TTFSb0ZubHo1NnlkVDBacnRBakw5ZFZmY3BUOE0ycXJUY2pwU1NIajdidTV3?=
 =?utf-8?B?bEVBT3lYWkl0OEtJdkxOS1U0WlRFd0x1VVVWQ0ZralZFQjI3eGNwTjRRM283?=
 =?utf-8?B?S1lqV3Q4T0lIOW1ONkM2M2l6Znhrcm5ldUxJa1JTZCswUTRlVExzNTcrRzJu?=
 =?utf-8?B?UEhwRVRPRVl3Mmtxc1M2TkhLbDdacExUcmJIL3RGRjE5ZUhXQWpUOWcxMkxl?=
 =?utf-8?B?VndWSmJidzRXaUNrSVFGQUd4QUMrNElUZ0s5RFhiOU9ySmxPb3VYaW00OTFq?=
 =?utf-8?B?ZFFaaVA3eXNMLzJWRi9SZmh2SnhvMmRrZkI2dTNzcWhrNitIZFFHWGQxalN5?=
 =?utf-8?B?N3VLYTZncUw1YWUzVzN5TEkwZ25BVGRUR1NMc3VKZmUvaEFwZ1lPaDlCdFhx?=
 =?utf-8?B?MG9mVzY3UjcxK2RyMWd2VHJDMGY1d3ozV1VJUUpVQWVLeDBrMUkwSlRkVzhu?=
 =?utf-8?B?a1hya0FKdmc4V2VjRDRPN2JDbzBHeUJ4djZzL2VaeCsvWUR2Tkl5NXR2THpr?=
 =?utf-8?B?RUltMVF2TTJTaDJsTktrSGF1Z2hyT0RlczRobTN6MTBOSFlLSG1OL09EbDln?=
 =?utf-8?B?bG9ST2JaK0Fla3BvWEtPbEpwWnF2VUF6R1hKeXJibFlBTThCb2N0WWJhS09t?=
 =?utf-8?B?WDQ0Y1NmZWtWT0lIOFdaZ1lwSXdDZGNNTzI3WXBRT21tVUxSTlM3MWNzUjdu?=
 =?utf-8?B?VWJnZFV0eXowTGxuaC9QN2c4bWV3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f81796-1fb4-4af4-8662-08dc5ebb2ba7
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 08:48:36.5273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxr1BT/27mdAZDgo0hkt/c8GTAClUtkxhkVHQXco49TmIjF0JedTZfgSRLarOv3x5g0+uz7oZzyXQ93UkaYZC2wls8P8onT65QNPoBL3+ZzZkKymlabkn+YanVEq93xg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9793
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Apr 2024 08:48:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5161

Hi Michael,

On 4/17/24 09:07, michael.opdenacker@bootlin.com wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Set a new standard to introduce project names with single quotes,
> so that they appear in generated text with an italic font,
> to make them easier to distinguish from command names and from
> ordinary English words.
> 
> Rework and move the standard for command and file names
> to make the whole description "flow" better.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> ---
> 
> Changes in V3
> - Mention that project names don't need single quotes
>    when they are part of a hyperlink.
> 

Don't forget the v3 in patch title :)

> Changes in V2
> - Specify that uncapitalized project names should remain so
>    even at the beginning of a sentence. This follows what Wikipedia
>    seems to be doing, e.g. on https://en.wikipedia.org/wiki/Perf_(Linux)
> ---
>   ...s.md5-add-standard-for-project-names.patch | 70 +++++++++++++++++++

[insert "yo dawg" meme with "Yo dawg I herd you like patches so I put a 
patch in your patch"]

I don't think we need this file :)

>   documentation/standards.md                    | 33 +++++----
>   2 files changed, 88 insertions(+), 15 deletions(-)
>   create mode 100644 documentation/0001-manuals-standards.md5-add-standard-for-project-names.patch
> 
> diff --git a/documentation/0001-manuals-standards.md5-add-standard-for-project-names.patch b/documentation/0001-manuals-standards.md5-add-standard-for-project-names.patch
> new file mode 100644
> index 0000000000..8b9e36dda6
> --- /dev/null
> +++ b/documentation/0001-manuals-standards.md5-add-standard-for-project-names.patch
> @@ -0,0 +1,70 @@
> +From 10924847c19a69a8f7fd2acd97f84987cdfea2c8 Mon Sep 17 00:00:00 2001
> +From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> +Date: Mon, 15 Apr 2024 11:58:54 +0200
> +Subject: [RFC][PATCH] manuals: standards.md5: add standard for project names
> +
> +Set a new standard to introduce project names with single quotes,
> +so that they appear in generated text with an italic font,
> +to make them easier to distinguish from command names and from
> +ordinary English words.
> +
> +Rework and move the standard for command and file names
> +to make the whole description "flow" better.
> +
> +Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> +CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> +---
> + documentation/standards.md | 31 ++++++++++++++++---------------
> + 1 file changed, 16 insertions(+), 15 deletions(-)
> +
> +diff --git a/documentation/standards.md b/documentation/standards.md
> +index e0c0cba83c..05c5afffe8 100644
> +--- a/documentation/standards.md
> ++++ b/documentation/standards.md
> +@@ -70,27 +70,28 @@ cannot be split without infringing syntactic rules
> + or reducing readability, as well as for command output
> + which should be kept unmodified.
> +
> +-### Project names
> ++### File, tool and command names
> +
> +-Project names should be capitalized in the same
> +-way they are on Wikipedia, in particular:
> ++File, tool, command and package names should be double tick-quoted.
> ++For example, ``` ``conf/local.conf`` ``` is preferred over
> ++`"conf/local.conf"`.
> +
> +-* BitBake
> +-* OpenEmbedded
> ++### Project names
> +
> +-There are exceptions in which such names can be used
> +-in lower case:
> ++Project names should be introduced with single quotes, to have them rendered
> ++with an italic font and make them easier to distinguish from command names
> ++(double tick-quoted) and from regular English words.
> +
> +-* When referring to a package name
> +-* When referring to the corresponding command name
> +-* When used in a cross-reference title. Such
> +-  titles are usually in lower case.
> ++They should also be capitalized in the same way they are on Wikipedia, or on
> ++their own project pages if they are not described on Wikipedia.
> +
> +-### File, tool and command names
> ++For example:
> +
> +-File, tool and command names should be double tick-quoted.
> +-For example, ``` ``conf/local.conf`` ``` is preferred over
> +-`"conf/local.conf"`.
> ++* ``` `BitBake` ```
> ++* ``` `ftrace` ```
> ++
> ++An exception is when such names are used in a section title, or in a cross-reference
> ++to a section. In that case, capitalization and quotes are ignored by Sphinx.
> +
> + ### Variables
> +
> +--
> +2.34.1
> +
> diff --git a/documentation/standards.md b/documentation/standards.md
> index e0c0cba83c..3fc5796301 100644
> --- a/documentation/standards.md
> +++ b/documentation/standards.md
> @@ -70,27 +70,30 @@ cannot be split without infringing syntactic rules
>   or reducing readability, as well as for command output
>   which should be kept unmodified.
>   
> -### Project names
> +### File, tool and command names
>   
> -Project names should be capitalized in the same
> -way they are on Wikipedia, in particular:
> +File, tool, command and package names should be double tick-quoted.
> +For example, ``` ``conf/local.conf`` ``` is preferred over
> +`"conf/local.conf"`.
>   
> -* BitBake
> -* OpenEmbedded
> +### Project names
>   
> -There are exceptions in which such names can be used
> -in lower case:
> +Project names should be introduced with single quotes, to have them rendered
> +with an italic font and make them easier to distinguish from command names
> +(double tick-quoted) and from regular English words.
>   
> -* When referring to a package name
> -* When referring to the corresponding command name
> -* When used in a cross-reference title. Such
> -  titles are usually in lower case.
> +They should also be capitalized (or not) in the same way they are on Wikipedia,
> +or on their own project pages if they are not described on Wikipedia. If a
> +project name isn't capitalized, it should remain so even at the beginning of a
> +sentence.
>   
> -### File, tool and command names
> +For example:
>   
> -File, tool and command names should be double tick-quoted.
> -For example, ``` ``conf/local.conf`` ``` is preferred over
> -`"conf/local.conf"`.
> +* ``` `BitBake` ```
> +* ``` `ftrace` ```
> +
> +An exception is when such names are used in a section title, or in a cross-reference
> +to a section. In that case, capitalization and quotes are ignored by Sphinx.
>   

Can you provide code examples, this isn't that obvious to me and I have 
done a bit of Sphinx doc writing, so not sure total beginners would know 
what this rule applies to?

Otherwise,

Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Thanks,
Quentin

