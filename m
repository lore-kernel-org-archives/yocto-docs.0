Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AE4C98307
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 11:09:28 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4547.1790161759001418263
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 04:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BTvGYOEx;
 spf=pass (domain: cherry.de, ip: 40.107.159.32, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sygL2FhZG56j7D0k2uGZIcQ122HVjoUTWEk5Rs0R8P97YIaB8FhKzb+XgsUJnDF+o43hpgWSgwsy39fUpFBU7xpGf6qM/omi2ZRcoWt81knJPPdWmIHgY6K/+0jaNf8+CMCRGA7DeVJBJrXBjcC+472jnfuIaJTkpLpmYYEWdtTVYrSjJMjfWF1BI8IG5D7XgabHFPpm3boEfuYZYgOwLb9Ye07wMn7tJxrP+CGsDdmbdj1W/1WoLitQgXx2hk64sT9EG8ZWF5lA4FLDzMaWtm9fnJJiElAQ5BWBH9MochwJWLqxRZ/JYOw9H9vcIRGwURz0HPqoKPc0OY6Dww+9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1s5XZqPJiweAf7EniT8ECY08YcG4D0r75vmZBKhIgg=;
 b=jCDld40nGWt1zjDmGcZkJpj4NTc4XzsC/eeFf7zn7OHZuJlSoL4F9i4bQwOLUekKs41yFQqhAsErKKyxHsJGlys/HetmmOIZpxabupXBEq8f17gmb7UZkw8oH0rpsbnN5yZqjIVgTqJ7U2+qZG1c44cG5Hlg33T1rvHD87o8suNk5nhNPx+TX7sXYx20ILg4P842sKipg2tTtvk7FuFDJb0YyEdFM1cfkVDbsWIS7drGH5UmBK2p2ywy480yRTsjtjcaT3O+6eSCzm25Dzkteyakn+C/nQa2diUyBP12zi56TAWADFy06OYy7+3c+d7XZaWeiSnJpGbhBkd9nrxZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1s5XZqPJiweAf7EniT8ECY08YcG4D0r75vmZBKhIgg=;
 b=BTvGYOExpXZ0137lm92fFRxutwoblIGq86JUItHZDUW2211dfy0xDrbt1ywqz5AjXToWPBViP6S2vAFE/y8k+1+/Yg6vzz29h42rFA4daw/PPnloT5R87CcGRlbxXgpGh8hSeIasTST9cs9jxDmlI6yNx6bf4PYdPspvMyJTrm8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by PAXPR04MB8989.eurprd04.prod.outlook.com (2603:10a6:102:20c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 11:09:12 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 11:09:12 +0000
Message-ID: <81ce3fb5-55c9-4b50-abea-aa0b1306bccd@cherry.de>
Date: Wed, 23 Sep 2026 13:09:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 8/8] ref-manual: put the ARCHIVER_MODE comments
 on their own lines
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-9-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260922183249.2433345-9-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CWLP123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:58::14) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|PAXPR04MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ab8107-fde7-4bd2-84bd-08df1963194c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	CHW7WQz8SshJmgXbX2QMbU57IeK5qYfNXkwMqsSdmygcjvEzU0c6LbRwwrwCeLOFiuSqIA1ofQzxOy8hZB9NBI8K8h23bj5PPn3oxr/Tga/AnvXXH7HCzKJp2YrKmD0b4VL2yk0ZaFGQhpMuDmsjzSf+2mBwQBNsdiW6ttU1aZ/9G22r5yC+jbb7UUB8QIDfWkRl7SkxNXLnDKMlu61mXTHUWJxBeY0LvTdxJz11jxo4kMHhWnMQPafimTSuCFhV+FebS4h7pnqYC+eZQN+X3rt3docjgXYNAJLKBq0MJowHMWhfjGesGI6Nh27/51nsjTmDy4WuuCCLXy2IM+r1IHdgy7MsQ3gALCbm+4CsKWZqgpwmPxUXGyOWZ/d4gv6LzrbJTGtwDFHIZ3hjjyn/5nEcWperbgoxSc28Op3jl2Pz01MvnkwE94VAN/nhtlxn/N9JGt9Oe5z5J+oLlRAQO4sPngZiPqJtna3z6baO0VtQHcc8R6iqMduZ3ki6sYSHVQnVEj5f066dqQODFWYMQFM7X8gBfAX/fBIT532RStTfgprb05wEnK1rHR1VBlqgNkyzV1HIOYd11HCnZ+W2JgKWZ3Up4NpFYygKEi8AWCGmpQl2u4FNqS5vNwrXTrQ41VyNOnkL0gm0hbddqclvQ5kbScbg5qgpoXppnz3mu2s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UklRdkVRM0NXU1VuV0VkTVpsckRKUzZsMm9oVG1EbER5ZktLbHY2cmhHeDVW?=
 =?utf-8?B?akZQS3FhWnVDdFdmaWl1R0trT3R4TDBkdE1SME02Vm40bDVLa2RGM01ubld4?=
 =?utf-8?B?elNkUTcyeEwxeEFJTHZYWVpNTWVDWUl3ZlVYdmdidWd6WUNYVVU4cVRNWWE3?=
 =?utf-8?B?QTRqU0RPcjRmVXhpejdFVTRCNVcyTHBubkJMZTdEVE9vR01pM09acDZNZWM1?=
 =?utf-8?B?MjBwYmFMZGFNNjdqWFJ1cWFRZE4zVjZNN3BxbDBKWmlhZGQ1TmZaZXVVeXdw?=
 =?utf-8?B?SlZpSmdmL1p2ZTRIOTRNbS9BMzFzby8rYkJ5WG96d0llWnI3NVBYYU56WTQy?=
 =?utf-8?B?UTgzTzFzM0VLVFF2MjdJdXVUNjJrSXRWS3lDU3h2ZzlBSmJnRE9TMk80QW0x?=
 =?utf-8?B?Ui9GbHdkQUFPc21hK3FLMHd6aU5BOWZSQm9LVFJrQWlURmFWeDNNVFo3QnBo?=
 =?utf-8?B?U3NUTjlWaGUxeE02TGpOc3NDZEFpNkhkdGdURGpaMkZ4MHpFdUlsbTVNL09W?=
 =?utf-8?B?N3VJQWo0R2s3NkJ1MGZQU2dYRnp6bkZBWFRNa1V3elNlUmVPMWhsRk10UjJi?=
 =?utf-8?B?c1JRWDNSOElsYXFXSE5pMUFVdFdndUxHSmJ1UXQ1RFJnV1g2Qzl0a0FIMXBO?=
 =?utf-8?B?Qk9Ya2l0MjZXSHloeTVaOGxNWUQ1MUhsWGpsSUtLMUhjSE9WQTVFNHF6UlJF?=
 =?utf-8?B?d0tBamxwNXhwc3Z4MGl0a0p2dVNLZVJUQ0FQTGFiM1ppU1FtTHlvUzdDb20v?=
 =?utf-8?B?T3Z6bm1oaWpWczNyY3BtOUFEQ2xMWnhDWEtqbnBQUjdqQlhPN0puYk1YcUt5?=
 =?utf-8?B?VWV5c3RMUGR1TVVpdFhwOUV4bm1LSjROWDIrRWRieWErQXUyOVhYTzZsMERk?=
 =?utf-8?B?YTl4WjZ3R1ltNkpJbm16eW5mZnkrOENVdFVPSGwwWHcyMlpKY21kY1UxVytj?=
 =?utf-8?B?NHJBUnJ0NmtJd051TTJKYzhrQ3pqMFRzNWZUZTZsVzdWemsyVktFQzNHbitG?=
 =?utf-8?B?WEYvRmJ5RE9MeURXT3lROHRvU2g0MWZhVEVwVGZlVk9FNWNFMGUranFiTFFK?=
 =?utf-8?B?M2plTWFnYXlSYWIwYlplUkdqOXlWdWlXT1V4VnF2NmF5YVR3M1JUT1dETCsz?=
 =?utf-8?B?OFVUVEpYVkNvM3JVcmFscFlDZlZ1cG93MTIwWllydUFTbVdNQ2Q1R3dCWXBq?=
 =?utf-8?B?VmlTbnl3TVgyb3hyN1NGTmFzbkNCSmp3VzhZdGFvNzI3Tlp2c0tRdmExTXhG?=
 =?utf-8?B?STBKUUdrVW40NDA0b29yKzMwSGxKNXlpQW45dmdKYWJxUXRTNjVuc01zUEpW?=
 =?utf-8?B?RmM2aks3NGRyL2xIM0Z1ZnNsQmlkZUx0b3c5cFd6Tkp3c2tIamJMZjdheW9u?=
 =?utf-8?B?ejVvTzA4eUM3TzFKSHA2UGdHRXh4NXM3NmhPVDVOZHJ2TFVkSVJIdGYvMHBH?=
 =?utf-8?B?eUZYQWtyZFBpMnZlaVBLQThBSi9XTFY4dThKRnljL1ZGblIvUTZ4bS9HaG8r?=
 =?utf-8?B?d2lCbHNRRUJQbTc2S0RrcUt5aUp0d2dOUmo0N3lmVU5UWDBtUG42dGIrd1Rl?=
 =?utf-8?B?NTlYUkVhcklnN2ZlYjg1b3V1NnZ4MWR2NFZ2c3JZdUI5cVNxMC92OUN6YVlk?=
 =?utf-8?B?U3ZGR3NBV3RIT251d0t2K3RYYnJOTndhQ1h2Q1hRbVQwNDl1SmhveThuRkdp?=
 =?utf-8?B?LzdPZEhJT1RjRDhQb0xWVTBRaTRwV2x5UzNOWlVMZnVUQVJUZzA2d0M0NEd0?=
 =?utf-8?B?SmkzRXFkYUFiRFFXV2NqR1JCdEcrTFFrUEc5WDlMdVNJNmx1aXA5ak9qRGUx?=
 =?utf-8?B?c2MrNEpDMXMwZjRXUGRaK29zMWUzcnpleVBJamtRVTRaLzFITTFyVktqcW1x?=
 =?utf-8?B?eXVEdFZ6TkR5NnU0bGNYZUZaT3Z1UkxQYnp5UHZyVDNxYzNzZmNsTjNFV1lB?=
 =?utf-8?B?aHBBQU05NUpZQXE1UkU5ak5wSU5XcHo2eXBhZWp6a3BidlBSSU1YVVI2cXVM?=
 =?utf-8?B?WjF1TGFueGNicXBNMHFaV3VNbjBGRkcza3F2QnA1L3htT1RoVWhOV3Nzdy84?=
 =?utf-8?B?Tk02T0l5SHJlZUF0TFQ4dThkQnQ0R1JuY2Q5YXRxR0lzSkorbDYwZnQyZDUr?=
 =?utf-8?B?U0g0dnZLUmRoWk44KytQeVhLT3djY0JOYmdwajNrQndxbXRsaXVNTElZWUFL?=
 =?utf-8?B?YTRoZEFUYlBDR1d5NHpETFNheEhJRUsyME1lSUcwbEVsMytBYUkwdU9qNWxD?=
 =?utf-8?B?amd3WUlVc2dwdFZnbTZ0bjFnV0krMmRSTVlBYlU1UkFWVTIzNG0zMVNXNzEw?=
 =?utf-8?B?N3lWM1R2NHB0Y3o1VThNQS9EZTdPSk9QbmF0a2ZnN3JUVGVJRi9Edz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ab8107-fde7-4bd2-84bd-08df1963194c
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:09:12.8189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSplQGw1au5XDwMlL6LOvwDs7bLA6n0oMXyJYvG9CHjdUipPZiYGE2x5clYIAiygVpWLUZvXRR2cJRKwuU1HIqgNRtG3hv2/8Zvxi+QHMM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8989
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 11:09:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10609

Hi Trevor,

On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> BitBake has no inline comments. A "#" after a value is not stripped and
> does not end the statement: the parser simply fails to match the line, so
> each of these varflag examples would be rejected outright if copied into
> a configuration file.
> 
> Move each explanation to the line above the setting it describes, which
> parses and reads the same.
> 
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v2:
> - the srpm varflag is no longer in this block, having been removed
>    upstream in d5216e3fd4be
> ---
>   documentation/ref-manual/variables.rst | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 8a9bd9075843..0d7069433bf2 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -158,13 +158,20 @@ system and gives an overview of their function and contents.
>         original source, configured source, and so forth by employing the
>         following variable flags (varflags)::
>   
> -         ARCHIVER_MODE[src] = "original"                   # Uses original (unpacked) source files.
> -         ARCHIVER_MODE[src] = "patched"                    # Uses patched source files. This is the default.
> -         ARCHIVER_MODE[src] = "configured"                 # Uses configured source files.
> -         ARCHIVER_MODE[diff] = "1"                         # Uses patches between do_unpack and do_patch.
> -         ARCHIVER_MODE[diff-exclude] ?= "<file> <file> ..."    # Lists files and directories to exclude from diff.
> -         ARCHIVER_MODE[dumpdata] = "1"                     # Uses environment data.
> -         ARCHIVER_MODE[recipe] = "1"                       # Uses recipe and include files.
> +         # Uses original (unpacked) source files.
> +         ARCHIVER_MODE[src] = "original"
> +         # Uses patched source files. This is the default.
> +         ARCHIVER_MODE[src] = "patched"
> +         # Uses configured source files.
> +         ARCHIVER_MODE[src] = "configured"
> +         # Uses patches between do_unpack and do_patch.
> +         ARCHIVER_MODE[diff] = "1"
> +         # Lists files and directories to exclude from diff.
> +         ARCHIVER_MODE[diff-exclude] ?= "<file> <file> ..."
> +         # Uses environment data.
> +         ARCHIVER_MODE[dumpdata] = "1"
> +         # Uses recipe and include files.
> +         ARCHIVER_MODE[recipe] = "1"
>   

It probably is also for the best to avoid long lines wherever we can. I 
personally would add a newline before each new comment so it is easier 
on the eye but that's just a matter of taste.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

