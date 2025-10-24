Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DCDCCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:54:42 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.64])
 by mx.groups.io with SMTP id smtpd.web11.15283.1761321278459773141
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NjDYu5U1;
 spf=pass (domain: cherry.de, ip: 40.107.130.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhE9V3YZvy+Ie71mI3n2/Ry1m/9X+fMyWNaKlEXoJfkKZZXsjq2Ue6790+NX4xuzGyAaOux8SVZC3BOcPsKyQcrSTo9+loMTkWYExOctEK+P5onzTLftEWZlLQ98vMhTRGHH/1i+4s1yp+RchN5twMVWrtRzDYoo8VxsKPIM7GDmFp+QBIZMZiNzclwV+QaeRYW5ss2AHEu48kD0D6M7ZY++p/Idc6Z43PirhqeBrH1DAzeGZ2VaJvbivw5UjFBwhex5r7yL3wgCaDqthCK43mAz82clduQ+ULSdLgpyyiHP9bdvfVmi91b/qUB6+2t1aB6GvpmNOdTOoChdVEpoag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKaxtNB/+dL9iAUOEdwPlupDvklsW4oveVC6/cnzzSY=;
 b=Az/R+T0yOPEMlc2eSpwgQffbAq5Go08UqFFg22xBIO3PJf4JZUetDK0lFC02GUQUOXa5w219g8RrOqaNyolOWJCO+xFZb3LisTOZoXlliyMkV+/F86i5FG7ha/rOnHZdX70Clm5DzHujyMD5ZM34uXx1qAo/YEEEieqP8hofwMvYTZZdn7ErYXqeMUqaD6bwxg2JFW5cDTqz2/dUvUdT39xa7dtRtXhyaOGJMTu1RkdAwaUPq5j2iqcJoCQ4wcnj6Gw5zqDL6cCMXTYPcwxQn44S+k/aIHF7Mqwsk0+/LT5P7P/R/IABlNtB3wMJobXBMMCRaWdrDVYWvvgC7A1w/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKaxtNB/+dL9iAUOEdwPlupDvklsW4oveVC6/cnzzSY=;
 b=NjDYu5U1jQLgrZFQXRtab51zMa0vk5kwKfNW3FyiIzSJbiuqu9G1LfBJpXzxZPGbxe/PDmc9yOLSjlA3sNSCi2rXxfnbWzxmKI3c4OOWNaP+Fi8j4lGsppAfH2ihhADityjgYyhmwz26Yjfeh9qyadfcW5m7Fx6VAIj+0+EVy3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:54:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:54:33 +0000
Message-ID: <855dbc1a-d5bb-427c-b44d-487ac7076600@cherry.de>
Date: Fri, 24 Oct 2025 17:54:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 15/16] ref-manual: document UBOOT_MAKE_OPTS
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-15-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-15-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB8PR04MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2d85bc-2349-4dbf-a498-08de13159fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RzA2Ujg3bkJlUHlabHhTNXQ2YzhiVW9WV0FXRmNMZEJlaFBNNUMzNzlnT2lR?=
 =?utf-8?B?ak0vUCtXUEREb29DY0FyS1d6VS9nMlJnWFVycis3cEhXUmVEeVpJc2d5T1BZ?=
 =?utf-8?B?MkJvb1dDdDJPb3ZDTFMwUEVWdnVtNlVTdHhSZlRVT2FoSXhJanFpSnJQWjhr?=
 =?utf-8?B?UTBncjhrNnpHUndpMjhpNGFDamNObjRpd1kzMzZxdDdUVklwQ0wrTTVXcExU?=
 =?utf-8?B?ZThkN1ZCekdFMmtCSGtsUlpnN3J3aVNmWnBGRzZCUE9naXhkcy9qc0dtSnFs?=
 =?utf-8?B?eEpQb0x3RlQwOXp5WUE2WmsxS2pyQTdEbThNMkNPUmVMcCtCVHJSRkpHOGN5?=
 =?utf-8?B?Q0x0WlQvWXVwVk95NHJmZWF4ZkFCdVorcUdyY0JZL0lzNzRpc05kbmtSdEdG?=
 =?utf-8?B?R0xyWWR3akhzWG9zTHVuanduc05wQk95R1Nwbk1wWkI1bmdZNUVCYzJISDVQ?=
 =?utf-8?B?MlFOZ3phSDB5WmNlY05jakcwTkt0NjdhMFF6NS9SSmpqd0luenp1cW1TWDQr?=
 =?utf-8?B?UmhLQlVlR0NVS3QreXd0bkF2YXJXSkI0Z2VsMTdKNDRGdnVuelZUQTFHTWN6?=
 =?utf-8?B?d294aHJWQjhkYTlWZUR6Rm1PaG1nYkVmZHZDWGJFVTI4bUlzeFRocWY4WDkr?=
 =?utf-8?B?TnhTQXRhM012d3JtUDkvNEFVL3RLdnhLc0hlVGpWbmdILzdTUmdmaWQxbWtE?=
 =?utf-8?B?SXc5eFBSNGhBQkZaZ2hYYVlMekRiRmFmZ0xIODYrdzVuNHNFa0JUTmJ3RWFL?=
 =?utf-8?B?NVJEN0t4WUxaQ2V6bmpiTzA5eHNMei9LSXJNREVpb0MwU1JtSzFvYUJ2Z3dL?=
 =?utf-8?B?WG45UTJBSU1wcFdJdTIrcWJWWGZRemNmdEdlSnBjUUJJSzFvTkxUaFFFakM5?=
 =?utf-8?B?MUdUaWhhc1lkd3hTY0dqdHZBRnphdUhVaTFhMXRzejh4SzlaSVdWZ2xFRDEy?=
 =?utf-8?B?dkllQ0QvSlZscVNtcG5JSG1iT2VCRWM5MGlTdDRmeG9KMzVvZ3VRTHhZQWlk?=
 =?utf-8?B?MXVPR0JmNkFaWDJOMUdYRUhFTmFoWThtbXBWZVBjRXJrYmRKYkdGNWdqSjJF?=
 =?utf-8?B?Z21hSENXU0VjMXJtVzZWSjZzbTBVNkJXUXgrT2dBd09qMTVSN0plVUttNTZ1?=
 =?utf-8?B?WG03Zmh0eTRQelhnQTJYMGtmTDBNbEtNREhFU05XeEFld1BLRzhncVFpUzRk?=
 =?utf-8?B?NHNvQW9DSm81cW9mS1BIZjY4SDNxME12Vk5ocFQ1NURsSk9VMXo1VFh2OHk3?=
 =?utf-8?B?QUJIQTZkNnZLT1grUk9oVnNHZlRzV2hhQjBaSm16SkNzbHdkakdlbjdoMEto?=
 =?utf-8?B?UmdyRVgvTG16eXZuYkxhOHpCNmZQektoZjF3L0VvSXhSNFI2YW5icGRhUU5B?=
 =?utf-8?B?TllmaVorM0tiNlB4VFU3a0lQUmZYekZxYVFJWkJhVmtGZUZXWVhDRGY4NTU1?=
 =?utf-8?B?clJxWjhUUnZXZlpEVUJONElpTjhmOXkrZjlEM2FueVpuRlByTVVPeDlWbGV2?=
 =?utf-8?B?bXlqNVg1ZE12dGlDaWdBZVc1aExhS0V5a0xYZW9XRXNiUUc3ZEl6Qi84VVNG?=
 =?utf-8?B?a3crMWxpSy9zUUc1NFJyYTJ5WXp0QW1ZUWxSZ0tnVjhuZEZDMCs2akpoT3pr?=
 =?utf-8?B?V1l6WnVubDNWNTF5ZnZQTlV2bWoxVm1xMUVncDlDck9mODRRc1lpQ2VmOXJm?=
 =?utf-8?B?M3Ixczh4MElGTWNhV0EyOUZXY2FjTE5hc0tmaXc0VkhlcFhTQ2ozbFUxOHdP?=
 =?utf-8?B?K2R0SjZNNUVsc0xKN2ttWVE3NkYzandqcjVCWkRncXRDbkd6c2IrNkpocmQw?=
 =?utf-8?B?d0ljSXM2Q0txOWowV2NCbFpSUGxPbEtEb0RXajVqcXVKTEZ3S2drK1FsWGlD?=
 =?utf-8?B?c0dmOFNsempRL3Bmczc3V05CbmxPdzVQNXV5WXBhbFhwKzRLZFVsT2NkZGJI?=
 =?utf-8?Q?AyqKbsbfoUyBE45HL0cmg9RwWmnqXt/v?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RnlDbTAxSldkVHZkUDZVdmxMLzNENHhrTFhQM1JPVzJGSEZTakZydGMxMFlm?=
 =?utf-8?B?QUF4bFFOdVZ1ZmpHWGFpOHJtQlJDM3RhRE9KRjNocllKZVo3TnVTSCtmczUz?=
 =?utf-8?B?ZnpITWxua3greFdLMEQzM2xEd1FKU0FkR3Exb3ZSV0N1aDZPVkg4Wlk0Ymwy?=
 =?utf-8?B?TlZVa09qSnY0L1Q0V3hQMFBIVzdLbUl3aHhsL0puNzlKQUl6QlhvQllTWlk5?=
 =?utf-8?B?K21TYm9DcWFDWHJTR0JBZTNLdDRUNU94YWwzNE5VMHQ0TTFneGg4YUFLKzFm?=
 =?utf-8?B?VTd0K1RiY1VSd2puYkhXSzRzcmtYRVNJeGMzN3RzOUdBOGdYRkJ0NHJIaS91?=
 =?utf-8?B?R3FFN2RYMEljalBkcnoyczRPWEwvdGMyZjZkNHNzQ05ramNsN2VrcVdPcHY3?=
 =?utf-8?B?TjcxdWc4TEkxNEd6cjRxTGlPNHNsK2dEK2o3SS93eStyZ1pzbDNqMHV2YmhU?=
 =?utf-8?B?VTljdXRSNUR6TjhDRVN0UXlrSmh0QmpkakZTaDRtOUYrakdWME9VTko0V0FX?=
 =?utf-8?B?bjMyZnJLbkpmYzVjWDNORU5HcnRDMGF1ZWtvbWlkaWFadVZmTWZ0NU1kUVQ4?=
 =?utf-8?B?OXdiRDRBRjZvOVh0YWZsL1RDNkM1Q0cxRFF3bnQyRW1LMGptQk1WZm1pSGRO?=
 =?utf-8?B?V1N6dHlFOGRDcHJ5SWFFY0dkaUU0OHlteUdrY21zdkpNNDJZUGtrczcvK2hW?=
 =?utf-8?B?T1ZGWFd1TmJyOXVRQzRPaGZUc3hsUzlIUjFGbDJXSFF2VlBuUUdwNldIaFEw?=
 =?utf-8?B?c09QWStSdXVZc05QMkp1eVNwbDBzR291eDJYTVpCSWJqS0JkTEpEbHJ2WS9h?=
 =?utf-8?B?ZVFjOHUzOW91ZzZwa2R2ajNrVks1RUdjdDNxT2dPS3RzVzl4V0NMS3M0UDFs?=
 =?utf-8?B?SC9nMFFId0VHWFRzYUtJVklScVNnYllxb2xSQWF3QUhSQW1lWEZkN0NndDNU?=
 =?utf-8?B?Yzg2Q3pTUWhKcm1YYTJaUlBOeitsdnVpbmNqZ2lXTEtMdEFEYU01Ykplc3k4?=
 =?utf-8?B?RUUzc081a0lVYWhRQ0hTcnpFU0lLc0pES2IrMFl2Zld5NnJaU2VHemw0RkFs?=
 =?utf-8?B?VzRyYWtiU2FvVWt3TWRJYVZtanl5bnVmdEg5RllnNzZUM1FIN2ltRTRxbzZ2?=
 =?utf-8?B?eE9yMGxqczF4Sis3QUsxU1JJZEVQZ3ZVZG5sM2pEMUorejhQQmhGUXJYek1F?=
 =?utf-8?B?SGc0NjM0b2dsTnpvcmR0d0lvdkNkd0x2L0FnSjJCUE9xWVFXYmNoOTFEVkRF?=
 =?utf-8?B?eGowckc3UHR4VU1HMk5HZUFLbWtBUEIrVm11clVxY09nNmFSNEZWN0M3ZVVB?=
 =?utf-8?B?Q1N2TWh1cHBsM1FNTlE4VFFmazhhVWNDVXM0NEtvYU1pMllrTTgyUnp1YzZG?=
 =?utf-8?B?V1d6SUhRQ2U0TTF5Yk9NRnhKREtqVFdFSmNJSDZyWTlUR3Z4YWtzR29OTmNQ?=
 =?utf-8?B?Zk9LL1cySmtYc2VCWnFNNExPMU45N3RSWHp4Umt2MTY4WnArRElYdExtOG5F?=
 =?utf-8?B?TDM5S2JPRVlvS3YrVWpaZTUwQjFSQ1BwOE1tMlo3UWlwTjdTTnZ6bkR0R0xa?=
 =?utf-8?B?eDEraG8vdVBzVXk5cHV3QTk2RUNnR0ZSZThZSkxtenAza0cxS2lmZzZYVjNi?=
 =?utf-8?B?S3BSalhPejhvUWpPa1dESW5vbWNTemhMNVZJWjZwS2E3WlRjbFJDbnRjc1Uz?=
 =?utf-8?B?RGtZVkp1aVYrbC9MYlVvUm00djY0M2tvWThQaWx3bUszM2VNOEw5R1hUQkdv?=
 =?utf-8?B?WnNTU3dVd1dBMHBETFJ3cWxNelVtWW1RVy90ek9mQlFaS0s3SVdoN0YyNnl5?=
 =?utf-8?B?MVdKZWZlSWxOaWtzek5kL2EwTDVPVlRTdUREeW9NK3lQK0dsczA4NjU5VDVK?=
 =?utf-8?B?UHVFZmdHNEFwV0JqdHhCS3I3SnVjd1VnVGdtVlduOXg4SzdmWmN6V0g2MkVr?=
 =?utf-8?B?WnEyZkk0NVl4d3MxbE10azlRU2ZBaVh3R3pWN0VpUFhoNlJIZE1hdW5nQVU1?=
 =?utf-8?B?alYvMXFwM2I3dFhtRVIxVktmekRXQ1plbVI0cVVSUXZ2SjZQUklSQzRCVzJm?=
 =?utf-8?B?dlBFTWpUNkcvN1BDRUZXdGxydjROMzQ1d3R5QkszOHczK0lIWGd6ZzZXNVd0?=
 =?utf-8?B?RWZZZys2cjNoWVppK2N0cFFteGwwNEdzZDQrU05lUTBGNDV2cHV0UWp2elNN?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2d85bc-2349-4dbf-a498-08de13159fea
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:54:33.2984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8I0A2P7WLoOwPw29Hh4MiHt2zyv3nZTweELcvWvNf5SZD56wGEHpFZlirma2DY2p0UwOF59dXjfIpSMCVIX8TsO9x3i+pzJmfk97eVu0SY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6795
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:54:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7834

Hi Antonin,

On 10/24/25 10:20 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This variable was added by commit 3338330e0c46 ("u-boot: Add specifying
> make options as part the config looping") in OE-Core. Document how to
> use the option in UBOOT_CONFIG.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst   | 13 ++++++-------
>   documentation/ref-manual/variables.rst |  4 ++++
>   2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 60529ef9f..a0089c415 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3240,8 +3240,8 @@ There are two ways to configure the recipe for your machine:
>   -  Using :term:`UBOOT_CONFIG` variable. For example::
>   
>         UBOOT_CONFIG ??= "foo bar"
> -      UBOOT_CONFIG[foo] = "config,images,binary"
> -      UBOOT_CONFIG[bar] = "config2,images2,binary2"
> +      UBOOT_CONFIG[foo] = "config,images,binary,makeopts"
> +      UBOOT_CONFIG[bar] = "config2,images2,binary2,makeopts2"
>   
>      In this example, all possible configurations are selected (``foo`` and
>      ``bar``), but it is also possible to build only ``foo`` or ``bar`` by
> @@ -3272,13 +3272,12 @@ There are two ways to configure the recipe for your machine:
>            u-boot.bin
>            u-boot-with-spl.bin
>   
> -      Setting the ``binary`` value to ``u-boot-with-spl.bin`` will make this
> -      binary the one deployed in :term:`DEPLOY_DIR_IMAGE`. It is renamed to
> -      include the build configuration name in the process (``foo`` or ``bar`` in
> -      the above example).
> -
>         This option defaults to :term:`UBOOT_BINARY` if unset.
>   
> +   -  ``makeopts``: the additional options passed to ``make`` when compiling U-boot

and configuring. c.f. meta/recipes-bsp/u-boot/u-boot-configure.inc

> +      for this configuration entry. The options in this entry are added before
> +      the options in :term:`UBOOT_MAKE_OPTS`.
> +
>   -  Or, using the :term:`UBOOT_MACHINE` variable (and its companion variable
>      :term:`UBOOT_BINARY`). For example::
>   
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index d249ca383..6aba20d52 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10842,6 +10842,10 @@ system and gives an overview of their function and contents.
>         Please see the "Selection of Processor Architecture and Board Type"
>         section in the U-Boot README for valid values for this variable.
>   
> +   :term:`UBOOT_MAKE_OPTS`
> +      The :term:`UBOOT_MAKE_OPTS` variable can be used to pass extra options to
> +      ``make`` when U-boot is compiled.
> +

Ditto.

Cheers,
Quentin

