Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062E9C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 15:10:02 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.27])
 by mx.groups.io with SMTP id smtpd.web11.20993.1738336199103136527
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 07:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mxrU6XuI;
 spf=pass (domain: cherry.de, ip: 40.107.162.27, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0X7EGs0ySfvevw6fkxXFMRak/dMGdOQxU2hGTP6C5R9jHKI0CCqxTsPzYJAjcC+BDcMzRF3ntzIsbvx9n4+bdsoB/vrSIUANrZQqok8TiX0VZedRTfWXDrt8bu/pHMoQiQ5y4U7Wllx6sPxhCRYcSP2hvmvKcKQSJwvWbdGP2xh/AnzqTwAGtrsSE5ZaEfkXNUPtEbya448PG8QDtzJzdg6dFjRbHxvCCua3ARBZLiGl3bA0VIQ31wAeEFDJUyQaGbymPeHK3BaSRXgG7rtfEWlrY12X7HGOnXtKK6Rf27+9CVmEWEJKXNC6XJA+bVaaMQ46qqprFEo47amoE5eXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1LCAO3uV2Qoj/FgqMj3mz5CjmRByZWzp3OfSIf0LI0=;
 b=OZG03woAR0i7NDjQg7cc7EvGadk0V65l9IfMkrgaghm70pxjIJCIyKm87XaT0h7iAVeNX5WDkj7abQAeRlPBK/UrKRKRU+WAQAgGXkPQylqCDxHWk2hcJBJjiqAS8yrLsWQBXqUm/cgGcCDRSJ5ef4837vOv+aDKWF2iEp73UXacQyolOSa87JMonvtrAdGgSRekJuE2ukmJvcxTLNrpRfUjiKevMoztXkBGS2/uzTt4HCBrTmYQWDsV6BN+wme6m0ZwndKRIEThmLBYo6tdQogGly5CDcNaco5Z6d2D5fE74Zwt4vWV5V68yb6ZAFCbW/2BZuwbZpivXsegISdVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1LCAO3uV2Qoj/FgqMj3mz5CjmRByZWzp3OfSIf0LI0=;
 b=mxrU6XuIv4V6XwoOFsIFifVYLb2L2FZU4PwsAgBgbyQndDSncf50lT+OFO88qpQCgdcQLV9u/sRID5htHDl/XfM05SHy8eM7ubXFreEk8/TTYiniyuVdw96p4Mwpiwv9QMaKjRSZQ4UIzL9tbNn/pdaldrKGk7Y/ETug4wnDMz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9327.eurprd04.prod.outlook.com (2603:10a6:102:2b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 15:09:55 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 15:09:55 +0000
Message-ID: <f6c77a80-b4c0-423c-abf7-d29c5a6cdf4d@cherry.de>
Date: Fri, 31 Jan 2025 16:09:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] ref-manual: Describe grub-efi-cfg overrides and
 GRUB_TITLE
To: Simon Eugster <simon.eu@gmail.com>
Cc: docs@lists.yoctoproject.org
References: <20250128102308.42435-1-simon.eu@gmail.com>
 <fd45d304-a3bd-498f-816f-cc80313a9091@cherry.de>
 <CAO8d5BY-jFbyOjcfHuS1KxDVzyn2FgQNtM9G0x5sB646OtHYqA@mail.gmail.com>
 <548d78ed-f820-46f1-80aa-10815c53a6f1@cherry.de>
 <CAO8d5BbLuK5uvfrk1p_Fj6sYyK9wxtXV_ad+kCdAtTq=GWsy1Q@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAO8d5BbLuK5uvfrk1p_Fj6sYyK9wxtXV_ad+kCdAtTq=GWsy1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9327:EE_
X-MS-Office365-Filtering-Correlation-Id: be9445be-8bf8-4cce-a824-08dd420951fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a0dyc0JTcFBKb2pkN1VvVWk1ZC9XNldqbXhwRkFFZlJuNUdGWHlXNloybXlY?=
 =?utf-8?B?eXljMUxmNzBCak5LWFBydENJdWpVNm9CeUZzak9ZdG9neWpNUnRTRlhFb1dC?=
 =?utf-8?B?eXY0akVjbHMxOVNrTmxMU3djMGFMelhQak9nMy8zTGdESFpDSVhOWUVPMTUv?=
 =?utf-8?B?Rm84RFhLcmFGdkdZR293WnhheWtrV0o4eWpUTTZub3VIZUpmOWlJT1o5TlM1?=
 =?utf-8?B?ZkhhVGhGTk5wN0IxR1B1bEFtTisxc05LVnRyNUdYYUVXWjRLUy9QcC9ySmRJ?=
 =?utf-8?B?Sy9leDFrRjJwQ29tdUVJWi90TERUNmtJd2kwa2MyU3ZvUXFXVVJFV3lSMkM2?=
 =?utf-8?B?RDB2OElXQWtMZkd2WmFmTHUvZCtSWlFKWGF6WXNpYmJVYlQvREF0ZzhJeGtF?=
 =?utf-8?B?dTIvMWZVNkQ2VkVnMHNKcE4wZUI1STg3TDRBSWdQRGpVNXRUazdXVFZPS2Va?=
 =?utf-8?B?KzRoUWdsNElocUFZVHMydjFPQW1pNDgwRjV6Y3hKaFYwcERJM2pBMlpmNmpE?=
 =?utf-8?B?bGZPMWh6VEtJRE1HcTJSTy9yekhyNnY2ZFJteVpUTkR2NENRa0V4M2NncWtm?=
 =?utf-8?B?MHhxbHFlR0xZWkxkVmNQeHducHZlNmw3YU1qenRnRThodlJkNjN4Q3dja0dC?=
 =?utf-8?B?dHRuVnZpZGVTZGE5b1J2bkxWSWFpSlFZT1gzOFZJeHArbElQQnhGK0syaEF6?=
 =?utf-8?B?RjZHZDhZZXZvS3R6eFltbGo0NXYwcWhuQkU0RHRkRUJvcDJwWXU0VVY0QVVU?=
 =?utf-8?B?QjNRMWx6bVBMd0ZXNUJOdGh5c1Z2c1VVMzFLVHhlSDZ4NC9xMFk3Z3lRVnB0?=
 =?utf-8?B?QnFqQ0hzcDgwMlF1cGJGUElPL0dYdVkweEx2S3JLeWUwcHVGWUVNMGtKbHRT?=
 =?utf-8?B?aSsxS09SRUJic0pJRXo3ZjZES3pjaEp3WU1VRFF4b0VpY2xpcUxYaDZjZDhr?=
 =?utf-8?B?MTBsMXcrZjBob1hWYVVVNVJPMDBDbUxSQ2lGM0JYbmoyZXV6a09PS0VqNkpU?=
 =?utf-8?B?YldQOFNFM2l1ZXc4SXlMZ0RQZ0dzdnp2SWlWa01VK2NIcG5zQURKVkYybFRH?=
 =?utf-8?B?Z2doZXdscDZqMExRMXFDVTRZakdrQ3F4NWNqVmF3WVBnSWlRR0s1ZmE4aTBu?=
 =?utf-8?B?cWxBVlc4dDVMU3FjaHJKb25yb0szdDA1Z2VLWDBqSCtZaDd2N1gzM2NYbEU1?=
 =?utf-8?B?NzJoV3pOTUFLcmlHUks3TjR1THFhck1aenRndVd0TzVaSWdYcDJZWmFtKzNr?=
 =?utf-8?B?UXJmWDF4eS9UMVgzWXFLbWZ3ZDlUMlhlemZXM0Vtc3IvVkFOS0NEVU95VjhO?=
 =?utf-8?B?T0lSaUM0VzYwWnN6NW1pUGJyNm02K2lxbk14M1pIRW5iY1hXVVEzdnJHRTEx?=
 =?utf-8?B?ZUNtSlZsdkF5Z3lOVzVUU0twWGc0MlRrbHgzUGRNZUIvNFFUa25BUFRDY3JM?=
 =?utf-8?B?VTFKRXpBWXN6SlpnRXpLb3k3WUZ5VXoxdWRhL285Z2R2S1RTVU9EVHhQMGhC?=
 =?utf-8?B?UmFscDllaW9leGhOR0lncXlTMlRwdmd5aXpKanZVT0VDNU9Sd2RxN3J5cmxq?=
 =?utf-8?B?d0V6SlA1eWpQOHdaYnB6NmZ5NHFCZG5FL2RiS0tnOVRCTmFyaU5MMVB4V2VQ?=
 =?utf-8?B?UWJkK2RPeE0rNXZMMWdKUHRDUmJHL2gxWDczV1Vjc0d1U21XcXMvZk9EdTUy?=
 =?utf-8?B?M2dTNytCcXE5MXhWWm81WVlkSjJHU01MTzc4VzQwVk5qUEp2cnp4UGNhSmxZ?=
 =?utf-8?B?c2FrMTdpb0FUbVJPTDI4dm9ySCtTQ2dHLy96WUNvNXpkNXF0TUJrRy9vejZ4?=
 =?utf-8?B?bzBQakpidmpENTlpMm91L2RXTmkxcjVpYUx3bmptcUlkS3BlZUowSmZYMk0x?=
 =?utf-8?Q?xzb6ZrTtWQjhA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RkZnSnpsL01YeFNPa3ptNkRNTVV3bjlDb01CcW5xNEVHRGN3eGd2N2pzRXN4?=
 =?utf-8?B?WWpFbkdZRW1ocXdDemxHYUMzelJaQjIyZkpPQjdSS1lyQ3d2UGZ6OGZpTGZ4?=
 =?utf-8?B?YkxZZW1pcHMrN0tXZWdrbndmcUxBaFpZZ20zcTVpamNLVk42OFdmdGM5TllU?=
 =?utf-8?B?aC92Z0NOcU1IYjVqNWtaMGkzcTBCR0VVR0ZBODRMS0FKS0dLaWJrUWNhbVBr?=
 =?utf-8?B?TWpWb0Y2RTJSV2U2WFJsbmFpb1E4MjdFY3NrWGVieDdocEN2TVJ2NmpXTEVG?=
 =?utf-8?B?OVA4QzFPa3hxYVdER3ZXb0wvNkxuOXBWbXVObWlSMDJkdkxNc1p2eWZWcXQ4?=
 =?utf-8?B?K08vUHV0YTRMa1NDdVBtd1NtcDJHV0R2dTFQVkd5enVJUnpGM0dRNFFVcVly?=
 =?utf-8?B?cXN3M0YxbEZRWGhRRk0rOHI1MDJQaFJYei9XT2dJSEg0OFk1YUdDV1BMRDc1?=
 =?utf-8?B?QS9SQzZHaDdXQlFRd09TSjVBamczYmsrY2JtZU5pc1IwSjJlNlRxUldZbGk5?=
 =?utf-8?B?emQ2bUdENUl2MlYzQmpLYWtsRGxRSVA3QzdSQ3A3NGh0WDlTdEM5Ky9VaFdC?=
 =?utf-8?B?VWNJWGdLbGtHLzNDTURqTGE5ZFJCS1JHdGtscWMzZ0ZyTlZacDBZcW5ibUtG?=
 =?utf-8?B?ZUlLcWEvRTBiamRJVjdUQy9WRmN3TlhVY1JvMENNaTlEVGZCeWZINDJwT3RM?=
 =?utf-8?B?bmdmeWpDd21Ia1VrWTFXM1krM1ZGdEtHMS9CM2ZqUVZqMjRVNWRZV28wbUJm?=
 =?utf-8?B?QWFuVnY3NW53cWtJWW1lcGJuNmJ1TnRHSzVKaDFwRzNzVXVMZDJsWExqRlRV?=
 =?utf-8?B?STRpK0F5cGNJUUw0RnVFNHlpejVRT2wxRndqazc2cHJXTWtDQ3lLSmlxYjlh?=
 =?utf-8?B?dTdpcWtZaVRDaXdWazV5T0Y2S0t2bXNJcUtGZmZXZ3FRaGlwN2lmODBYd2N5?=
 =?utf-8?B?V3hibWhwaWJwQjNBUjhwT3ZrSW0yTVppWDl1V3krckhydU9zMkxMbE9yK2tD?=
 =?utf-8?B?eS9VM3M5S3RHVHR0NDRhT3cyVm5STUd5VHVhSnJsTHJ6bFJKZzhQQjdPUWpr?=
 =?utf-8?B?VzBPbjRaQ0hzK1BvdC9xanNHTEovUjVzWVk3TGl5c1dodlJXd1NRZDI2RHFL?=
 =?utf-8?B?aWlLQ1l3QksycHZkVWxGTXUwWXFiVk1NWlFWVGVYZVhCb1ZOcDdqS0ZiNlk2?=
 =?utf-8?B?WDhJTXBlY2oxM2dBdEEzOHpwNkVzWDZiWWxSTGF1ZFJZQ0N2bVlScFB1WjBC?=
 =?utf-8?B?bEZiM09raThsa1Rka3FCYUkwdmZ3dWxOMjVIZWVxQzJvTFlBcXQvaWE2N24y?=
 =?utf-8?B?R0tTamxXUGl5cm9wT2pjS200Si9ZenIxRHZDNUpxZGxlN2l5SDdwbGNRWUx5?=
 =?utf-8?B?VXNqNm16TytEL1M1VWNkZVlLdTBRVkZYbGJHdXI2cmhzWWdLcG9HV3J5cmh2?=
 =?utf-8?B?RkxvWlNuc3ZYQlBlcHQ0Wk9FbDF0RFJUeU1ERHhsZ3VNMnM5QTNTWWpxSmw3?=
 =?utf-8?B?NDNxTjFLOGtpcGVXWVRJcHZqK0R0WXpUTEpsNDZzZmhqUzJldUhvUG40RGJ2?=
 =?utf-8?B?ZGZ4UmI2Nm9nLyt5SkFlaVB5NUZ6aVk5aDh0eWp6OTlIUFh5ZDJaWXZlSGNv?=
 =?utf-8?B?cWdSdkR1cmVMYlBjSkNNS1R3Z1dwVnJzbUtXOFZTWjFtQnNOTXY0MUJnVXMz?=
 =?utf-8?B?TlNZNVFYWUFLVnZTanRoZm0wZUs0MUp2MlZ1ZnJWcElvZmVVSDJtSS9ZUlpO?=
 =?utf-8?B?ZHozNmJmQ1NwMXYyYndoQ3dvaC9BTW9vZHFYSXlQL293NGdWSDVpbXlEblYy?=
 =?utf-8?B?Qk9HakZOYkNCQkZVMitTQktkb0VqYkdSMS9Zbm1XSFErV21JYjY3UU0xSENk?=
 =?utf-8?B?dTFtS29RRGtmOGZZcXR3K3BxVkZBdS80Ry83VFJSZTZXbjlyNm1EQjBNSnZh?=
 =?utf-8?B?TWNmQVNYVUU2Qm5VLzBqY2hEZDR5QU5QcFlDRU5XRWRoOGMwQ25oKzVyUTh1?=
 =?utf-8?B?cnlQT2lmQUg1M3VsR3dhNVJScTBqaVdmYUNIS1JIMSt2UElOQStYQzEzRlZM?=
 =?utf-8?B?Mmc0TnlROUptUHlteTBxS0ZQTlBsWFhlTEtXbldmVXBQbHA0RDBIeTM2dTVM?=
 =?utf-8?B?QXIvUDI3ellWQXdoMmtWeHVPOEVYMEVSWk1Ec0doODhPM200cDd6ZjkrUURM?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: be9445be-8bf8-4cce-a824-08dd420951fc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 15:09:55.5629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76lhvmDct7T6lTb3WkgkR9S6S9Brxefonh0EOGa4tELLuWUibvRwqR8viL6HKd41RWzGHxAKvKxeMoXAqzVes38RoTjGhWBf27N7OHEerlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9327
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 15:10:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6236

Hi Simon,

On 1/31/25 4:05 PM, Simon Eugster wrote:
> Hi Quentin,
> 
> Ok, I see! That makes sense. So find found the grub.cfg file in the build
> directory at
> work/intel_corei7_64-poky-linux/IMAGENAME/1.0/IMAGENAME-1.0/grub_live.cfg
> and now it is on modified. So I ran the build again after changing the
> variable, and it was updated.
> 
> Was this a valid test now? :)
> 

It should indeed, and I now have more questions than I started with :)

Will try to find time to figure out what's going on on my own.

Thanks for testing!
Quentin

