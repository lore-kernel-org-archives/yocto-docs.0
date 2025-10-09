Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ADBCCD187
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 10:07:36 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.1])
 by mx.groups.io with SMTP id smtpd.web10.8544.1760004442245674991
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 03:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EITfgxku;
 spf=pass (domain: cherry.de, ip: 40.107.159.1, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyWYBJpd0UP38sQKncZXXfAfotkKblqyhd97VlikRDNhMng4XtY4/vOJJkZrMDCycg5ZboKTJxtCftYLnSIV/yOYXJRFknhdP3A6DIUo2bo7wcWUH7qxrCmbRFeRLBpDze0xDzaBCMp8QIwqKminNmHDUYaWnOXXP5zHrR8cMSW5ZhgMUuVGCwctvcbuxvfChGk3KnZSzJyYkF7YlZV1LW0SyxctBvx/PC16q/LR8W/bB//3rbUlw/M4hAPTotkMy2HzI59sF2FP6mS+zaINMyZZi9eQPtZ8fcRrDx51dQW05EVRZ1USulcjKZu9FrpgUaXPHqvohONlcbLqUwhWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISv9MAKR6K4GF+ooVkyY5THk67xb2e1dujok4P389o8=;
 b=w4+gW9r3dUEcL23GJVq2HhK61aX5mM92Q6RMJRjWcdpIslmvDR0XPjREO/nMds4hr2+UqINg2ZePgqS5E1N9OaS4YrUmi/F7ImomtncziWCFZSZYctvrZYUR6NSYAwR8220DQq2MgKf5nhzFVAM1xKD+LFMvbrXxjWHKnb8AUIMU0QbeHYIU4SFbeTPPe73t2d6YPfP4cQEU+jZFe9kODKaAOTLEckMvfgZOhjUY1nMcXIsA2BZcHgUWM2LRHDx+bjhWzctxQXd8y+bhxQWi8RhzYa5xuuxofx2P3t6krppw6jLVIcGyvYOe5P6JccgDw2Ak7HT3XiteZv3AgD+TCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISv9MAKR6K4GF+ooVkyY5THk67xb2e1dujok4P389o8=;
 b=EITfgxkuonBSYpHM9W+NHi3h5nnQGd6hv4GLwEli57UetZeydKmSRGPpoJUTZI/XvUBU3VIxne7k32SfH0b9AbimI+y79lsb2RTTrJZxzWKSOH2EAq9D60QyCQ3+t5R9XAKN9Lvq78pjNIHBL4emDNqivmsLmyqdIRMKH4NoRCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10295.eurprd04.prod.outlook.com (2603:10a6:102:447::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 10:07:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 10:07:17 +0000
Message-ID: <3fce0896-3f41-452f-aa45-4d239dc2d5ff@cherry.de>
Date: Thu, 9 Oct 2025 12:07:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] tools/build-docs-container: make concurrent-safe
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20251009-iid-file-v1-1-d9ca8563c88c@cherry.de>
 <DDDPDWQEDH3V.1L0AMHY2FAHEZ@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DDDPDWQEDH3V.1L0AMHY2FAHEZ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10295:EE_
X-MS-Office365-Filtering-Correlation-Id: 8447028e-ea09-469b-a735-08de071ba099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d0tYNU9tSW5ZcmJNUXk1NmNMSFJYMlByMzNRWkgxaGFrVzhZdDFJdkJKODJn?=
 =?utf-8?B?QzZxQUxxVW9BRTFOTkpvZy9TSmVGV3hrZ1FvMW5yR2NZcHV3MExUV0JzQnpW?=
 =?utf-8?B?RHFZZ2VnT1h6N2N1aDJkTmhKTEFYVFZTM0g5SHk0TGlFSzhQR2FHYXRnT2ZM?=
 =?utf-8?B?OGJJLzRRNTNzQkVGRlpycEYxZFZkUEpubVNSbFh1RlpLREdhbnVqTVZqTjhI?=
 =?utf-8?B?cTBxNCt0Y3BHTC9Ta3U5c3Jab3J0Rnc2R1NmQ3hVU0F1dzJsQUN1YThWNWRP?=
 =?utf-8?B?UldndGYrRklwUHlNdTU2ajk1RFA0OG9udE5qUUVXSnlITms3TUxoNzN5YU9I?=
 =?utf-8?B?d2xGVGI1MVRCZXNnMmhRd0dkU1JvdkpDNlBNRGtKUVFBeDdKaC9RczN5TnB1?=
 =?utf-8?B?bVZKTlZSVzhkdThreFZQUnhBdlJwVkRFZUhZZnd3b2xFRCs2NFBOMXpkLzgv?=
 =?utf-8?B?a3BSaXZKc2pwWlhRb25HRGlUeGVDSXkzSDBuN0lhaStTMHZKSlJxRVhUc0RT?=
 =?utf-8?B?a0EzemM1eVVLRUZYcUl6WFFHc3pMb010SGtXc0sxYVlpUEYwcmNlT0t1Y0pl?=
 =?utf-8?B?b2JOdVMvVGhHVWo0eDR2RFlTQ1haYURFbm9YbTY2SWppbEIyWEFvcnZka3pK?=
 =?utf-8?B?RGNyM0F6Q2VzUDNXK0tLSTI0c3lxWEQ2TlUzMUtjK25IWlljVXAveEVQdzNH?=
 =?utf-8?B?cXI0d1hiQ0UwRkxxYitnL0JPMXE0RFhRSlUyc3dOYnBVWnI2bWd6aUhQc1da?=
 =?utf-8?B?WnVwTDJmS2xzanZWbFNkMUhYdG96dUtuc2IwZDBmY216R1dlR3R1OE5uV2RF?=
 =?utf-8?B?WG1iWjZreU5jSG9DNEdNbE5KazBuNzB5QTVyLzZTbmxvM2pIVUpxYUpybFVp?=
 =?utf-8?B?a3FFWkUxMlkrZVF6bDVCNDBjdmd5UERzSlFxVU96eTBvbHZPTW5LNlF3ZHJt?=
 =?utf-8?B?WE1UbitRRkVjTVZpSStFWU5FUHVuQWIzcjZEMS85L05mb2FEbVZYVjdBYmt4?=
 =?utf-8?B?Nk8rRlBLWU43MDZ3bzNPTjdXNnhLVDc4anJtbjVYOER6VWtOSDE0UVRoRjUx?=
 =?utf-8?B?TjdxNjdVSGZRMVhISzJSTlBOdER2eDlXdWdnemQxN1RpbkE4blgrbjFKSTVU?=
 =?utf-8?B?dS9MQkVCWDlBeUlJTnNPSW43MmN0a0hqUWpsM1BjZ1haR000aFlvOUtvajdB?=
 =?utf-8?B?dHpGQzF1SjU2Ykh5Nk5hWE9oalR1VFZPYjV6RDZMZ2FzUWxIK2JTTVo3d1RW?=
 =?utf-8?B?Mm41YnNiQndnN2JjQ3hqcVk5V2tYa3IxMXA5WURMVUQ0R2JYN2Z3TTNQYytU?=
 =?utf-8?B?cTExcVBBRXBZaVFiSXE0TlNtb2JCcWlNcEV6NC9QZURhNHV0U2RYZGkxSm1F?=
 =?utf-8?B?RDZReXVndWdUS0FoMVRTbU54Sjl4UnBkRVNOVDg5QzlWSjc5dmlhcTU3anla?=
 =?utf-8?B?OHJGZmNNQXRuWnhBWjBqLzgyM1RPUm5XV0l6WHZyMW8rM3I5SzFHM1VmVE8r?=
 =?utf-8?B?WXlLRklwTDZWNkU0NHNJYmdNWVdrU1htb2grVmpjbld6MDNhNjA5Z1VFNHRr?=
 =?utf-8?B?OVlOL1N5YmZzNGJ1dU1FY05mTUdTWmhPdmUyWXdESE80MlprMm9NUjlHUlpP?=
 =?utf-8?B?dFk3WTR1TVBhQTN6dkhqQ3BpVUI2WVZGS3gxK1FMKzY0VVlSK1RFdW1tRjFW?=
 =?utf-8?B?SVlpMDdZZXQxUlM2dGZBQzZDU3RXMGo5VGJtMlRuZkFWSCtFakVIdWVBQ0Vl?=
 =?utf-8?B?RUlERGQ4ZGFOYzBwY0Rwak9HOE1lWHkxRG5yaENWY3VFYjhIWm5NYTMzTVhu?=
 =?utf-8?B?aUYyWFJOYkJuV2JkelhSRHo1ZVNXYnUrZE1ZZVJaa0tUR2V5Tm9jUlZmVklu?=
 =?utf-8?B?Lzg2eElLME9rR2phdGxSRERaSEJqMVYyZCtJUVlqUCtSSEE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THZRV3ROMFNhOTA1ZFYyU251K3E2YmIvV3RObklPSWUyTXhOQWVUTHhmNzRV?=
 =?utf-8?B?dVM5bVRJRmRMS256cmJacklWbk9TWkRxQVp2ZUgzR1BLMXo1Sm9tU2FTaEhs?=
 =?utf-8?B?WDR2TFc0T2svanM3OXFUL0hqOVc0TDdGVjF1Nmp3ZTd4RW5FVjRFd3A3Sjdn?=
 =?utf-8?B?QXpGdFd6TjVBMUViT0NLTnN0ZzUreitNbmlSNE9rY0xUdC9RcmEyWmVlUnlw?=
 =?utf-8?B?NmYyQk5qdHJKZlJVMEhKU3FvSU12WnJ1dTRJMklOM09yeWYwMVVYSTNwZE1G?=
 =?utf-8?B?YmhEeFppSkdxcXpJL3FVSjNNeW5wRzdCR1pzZE9CdlR1ZTNiVlZCc0tzdFZR?=
 =?utf-8?B?Z0Y4em5BZi9iNUtpazFpOC9BUnNpb2ZxTS9uU21wd25aN1hDZEUvTVB1NUs2?=
 =?utf-8?B?MENTUGhEMW1pdnZ3ZFUzYmRlZ0ZFVEk0RGRuNWo4R3c0ejRMUnFnWUtwbkJa?=
 =?utf-8?B?bGZvRjlOMHJ5eFpRQkkxOFFqSWgxNkRKS3lDTXFVQWZvQmJyV3JwZzEwT1NF?=
 =?utf-8?B?OFZoaXVoWWpCNVJWTGRmMUlzaEl2QXlxOG1zSFRFWThIY05EQ1pTc1VKa05X?=
 =?utf-8?B?em9nNms0dkxNeFF5SC9FRDNXUnF5bmZRTWpjcUt0a2NMdU9pTTJiSXVyclBR?=
 =?utf-8?B?MU91ZGlXU08yaXBCYkJSdEtManV2dW1Td3NkZVdhWHppWVRGaTlDM2ExMkZh?=
 =?utf-8?B?RElaSjQ4WkE2UzhvZ3FzRXloR3JzZjNkZ0J4WndvOFo5YWFYQVBra2dTbENO?=
 =?utf-8?B?eHNib0c1bkRObGZDTkZiUzNLU2FITFVncEFqWkhZcGpRU3F5S3lNV1RWbmtw?=
 =?utf-8?B?bUUweTlpT2YwRDNXai9vSlM4ZFE0VnJkNXRraFhOLzQzSWJiTktVck1KSXhU?=
 =?utf-8?B?NUJmdzJSdlllYk5mYmZ6OGNKaVVxbVRyOGo4OW9CaUdNend5U20rdXFLYVFy?=
 =?utf-8?B?MFdhVEFZYmxvdDNHc0lVdGY2ZzJ4WUNSV0lROXhHM0YzRHpCcGp5d3c4WDJN?=
 =?utf-8?B?emZ1MG5QbHF4SkJGYVhPdnJReWhhS1U5NEhra0I5QmpQWHJLZ254T2I1WDgw?=
 =?utf-8?B?RG9oK2Y4LzJ5dW1PNTFMR0xscDRhSGhFSXFCQ1lkRjJuSTRDQlNqUFoxNmgz?=
 =?utf-8?B?dXlWbTVEWG91VzVzUUpIWXl5NGJ3RExuaHBka3VIYXE2MVJrZVNHSVVUc1RZ?=
 =?utf-8?B?QjI0c2FXKzNuWTMwUDRIbGV5bGE3elBacmpDa3BoZ2ZiN3JEYjlaU1FDdnNN?=
 =?utf-8?B?YjBlaXJPSldBcTh5UFVuQkxkd2h3N1MvUEh1U24zdHY1YkF2ZDZ1SFlGOEFH?=
 =?utf-8?B?Z0FieGw5QTVRSlhXOHZwNUNjNWlxaDNxWnpKcm9hS1EwRlE4UjJ0bGdDbkFa?=
 =?utf-8?B?NkM0bVVFTFFJNVh5OTZhcGgwWG5CTXdyYlFLR1B1ejZobHFBTDQzVEN5emxG?=
 =?utf-8?B?V3E3M2YvTTBIc0VaUXhvbDY3M3RTZHZFdzFDLzN4cEgvMlljbHZGZE9EZFBU?=
 =?utf-8?B?VTE0Y0ZJU1MzM0xrbXRjSFVETU95dW1xS05TWFZMZm9ZNGg5NlBKSHc3czNO?=
 =?utf-8?B?aWhCUjZRcStERkZXMjNvRjllQ3EvVStUajE5WnpmWUkyMVlTZSszOG02NllF?=
 =?utf-8?B?blVtZjZ0QWdvMmliU044aXhsYUg5VW00NUo4VlJveFBjaDVXdkhSOHl4ZDhG?=
 =?utf-8?B?c1VmNkhMVVdxdnBHcmZQUHVGWXUvV2xDQ09JcUpaTmo3akpQTitTa0pMME1r?=
 =?utf-8?B?S3J3UXpUcVhIUGUyS1BiUytSVHp4bENGRU9Xb3Q1clNOYVVkNHlCSzFweUNO?=
 =?utf-8?B?MGJMTHpJZno5SWMzZkxFM1QvKzhvVE5DMjRWWmtvTnpScWh1OTJkV0ZXbDdi?=
 =?utf-8?B?UjhBaFJESEVRRjVaOTBpblhPM3Q0N0J2cW1BaVg3bjAyYlAyRDlIVDBoeGhU?=
 =?utf-8?B?dEVuU3hUZkZVTC9vWUVkV0JuRkZkMlZxZWlRcEQwaGhvcjJFRCtWWXp3L0Zy?=
 =?utf-8?B?azV6aVhNUHJYelorazBxUGtFWTVQeEhIbEloOHBUMlFlak9GS2NONG01TWor?=
 =?utf-8?B?SFRpYUdjTnQ3QXlseFNHQ0dhaktWOE1lY0ZBVkJHR05XbEJ6b1NkUjZlUjJO?=
 =?utf-8?B?U1ZMek84SkdScjgwY0hwK3VQWWxkSXlNYWVqSnFlWitsTHZTKy9lamlEdm1v?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8447028e-ea09-469b-a735-08de071ba099
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 10:07:17.6416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bYz3lY/MIzoo7sblFUVnvoEfciq18JDxN9fcrzhszAtktqXvSeVLzWGzH3n0kFtoS4BsQIAmZcUNGRtUzfLuBbIxmFJdqmyrpVCHNBt98c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10295
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Oct 2025 10:07:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7675

On 10/9/25 12:01 PM, Antonin Godard wrote:
> On Thu Oct 9, 2025 at 10:59 AM CEST, Quentin Schulz wrote:
> [...]
>> The only downside is that we cannot infer from the image sha the
>> underlying distro we're testing.
> 
> Maybe we could retag the image after it is built and include the image name +
> the sha in the tag? With `$OCI tag source dest`, then `$OCI rmi source`?
> 

You would get one tag per run of the script, polluting your image tags.. 
I'm not sure it's worth it tbh.

We do get the output of podman build though which does print the FROM 
layer, c.f.:

tools/build-docs-container leap:15.6 html
Emulate Docker CLI using podman. Create /etc/containers/nodocker to 
quiet msg.
STEP 1/12: FROM docker.io/opensuse/leap:15.6

We can also add an echo somewhere to display what we're currently 
testing for example.

Quentin

