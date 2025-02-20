Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F6EC021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 16:18:57 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.86])
 by mx.groups.io with SMTP id smtpd.web10.683.1740068333242183802
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 08:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lVEe/iqa;
 spf=pass (domain: cherry.de, ip: 40.107.103.86, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLGTfEZmhVpfWUFzroisG3jv2f1wTWZpPXfUStl9J1fgkPXp+bdutN8Do26CFA/gZornraKO8h3h7M/KidLKrRc94ar6OhxJ3T1rlLMEYEoumXOgFJzBLzcYL3/5yzvq42/t/6BxVOb1MjIMtyhMKdBmo3/fnhH+OA+mZqZxSDA9UUV/QPDWh/a0hZ8kYeIXMOyTlw6a+AQEbkwE60JyWN8J2LYiU12khakkedBRSssY/G11QJYTk/923DXOlah0xoe6xkgcuWq62Zx5zvaao9xDMYv4kBQtB4+VCndXmslsOGvF9fY+4kZa7/jEfGp/+3+f6FKLSqmsV6ZyqyEOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEUqpPkBGDLPPXarKclNmwzF25nusZyGqGOz6/0V0eY=;
 b=sPKXaHfEJn9VGo7A9NXONLUKc2A9r9RTZDOvEQb9qU2IpRt9Q5RY2++tyjUTD4uZKtpCMUfUc/bLgPIUvkh1JQ1CX0fOGi3KuA7/95J04Vtv8Tc0qxkQRtoabXLBqVU7+2R9Qhoiydhc8Alhr+lqHP1CBxNNAy6mev1T+cnFfiE2k4fItdOi2nyL5FpELo07IL34TRu7X6SXD/aOaVsk61m5Vok32AQ8aKHhHMw83qVgL6Yjvo6W1ZukYP8AUMtfcQrzCbw0UP+j0pjNDdbKI1VzyF30VLyyEl68E4TCqwYkMa2+DWNdrcZqeXrMM0aeejGAlsatgYVWXcRPm33R/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEUqpPkBGDLPPXarKclNmwzF25nusZyGqGOz6/0V0eY=;
 b=lVEe/iqavq4ostcb2AMHRqOFTFjPEb7ySR+6hOxg4ccHAFQKZPRTVSh4SUfKfQ14dXyOoEwaHifIXArGOxJKwERVefyrLWL4XBIcDFzCDpIsovuqZb23EGm9EhnAQiKU3b093wXp1nN4UlLnZHiq2yNjYACez5AvO+MkADQVUWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8213.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 16:18:49 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Thu, 20 Feb 2025
 16:18:49 +0000
Message-ID: <c11747fe-fdd1-40f5-943f-a8e999573e6e@cherry.de>
Date: Thu, 20 Feb 2025 17:18:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 4/6] overview-manual: convert
 analysis-for-package-splitting.png to svg
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
 <20250218-overview-figures-v1-4-75d23b5e7a88@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250218-overview-figures-v1-4-75d23b5e7a88@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4db9d7-9cc9-4b59-2034-08dd51ca4269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZUZyV1dpcSs4TWNvZjFEOGdvOUZ2VlcveTh5RnhwaUh6UnQzWWUycTNzMURi?=
 =?utf-8?B?S2ZrbmF1UDJOQWQrUElsVjJYSmJxVXhMRVZiY0hDaUtpRWUxSDExVU9WU3Bv?=
 =?utf-8?B?K0YzNjZGcmZhSUFvc3M0Q2pmRTFXUFZXQkZTcWRpcVQ2N1hlSzFsQ2YyWUhZ?=
 =?utf-8?B?VVhYWVNRVlhrNzNnckx1NzRqS1pOai81VGxNOGRhdEtDK1FwUnlneUcwS01a?=
 =?utf-8?B?MExNaGFOeklDQjVCU2kyZEVHK3YwSEwxbWJHb3FiVEVvVVJacTZtZGNMSXIy?=
 =?utf-8?B?OElIZU5GWUpWRVJFK3I3aTQ0WmdGcnhlWUQ5cWNMaURGaXVGaUVFTGxRT1VE?=
 =?utf-8?B?SE5YUHNKbHJWZzZZeit1Zld3RHJSelZvYUo2ZkFlWE1pd3M3anY5WUVVUGpw?=
 =?utf-8?B?dHNMZHo3RUtGVmdQOXlWclZmSlpFV0J4TGtUeXJmQlhlSXRiWmFNcGY5STdH?=
 =?utf-8?B?SWwxa2d2enQzdVkrdmZEbnY5UWhQekJ2cG90ZW1jdEZZREZLVjB6bzNFSUZn?=
 =?utf-8?B?YnQ1VmI0cmpjY1ZFUjNSTi9BL1JVUmtKSm1qRHEvaTRwVFFsZHNsUUxhNDR5?=
 =?utf-8?B?RDJVUjJZQWFjNlgySWVKaHZPNnltL1B4dFE4WDZxdnBZVndsbVZuUG9vaEhk?=
 =?utf-8?B?M1JDSVVWbUpSWERqdFJLTWpKanpPNjdxRTM0ZDNyRjdpNFh6OEpkdmZoZVM4?=
 =?utf-8?B?aS9DWStIR3E5Syt3NHYxajF0cS9ROUcwSWJwN1NoQlIybkRUZUtWdXc4T2Ra?=
 =?utf-8?B?TkFkdTNJMUJINldQb0dtQ0tNK2Q2a0ZLQVhjTzIwdVZwK1dhSHMvN3YvcUFE?=
 =?utf-8?B?dWQ2bkQrVmpOU25XMEdyd0pIRmVidXNxQmRPZEdyVWJScUozRExvRC9FZUM3?=
 =?utf-8?B?NFpSZklQSzg2T3ltTG94WHpIOTRmMFZ4Y0pwRGZwQ3YvTmtVNGxYNnFQa3J2?=
 =?utf-8?B?MmFXNGJGM2lwTzdRbWlGUW11eWtBZjZ0QWN4b2RCdnprUzBLcWhRVTdrVG4v?=
 =?utf-8?B?cG1zRjRtb2JYVURUOG1WbHNuS3Vqa1Fvd0RXTmcxcnlMd2Qvd0ZGSFdadWZH?=
 =?utf-8?B?Q3JrWk9kcjVYZFVGd1haK2RoWVZHU3kyT1FwZlJra3A5N2xWRkNSa2hkbHNj?=
 =?utf-8?B?dzcrWWliN3ZSWUhqWmJRelc1SHd5ampoVHhnSVh4Y2RESStwemRud0tyejZi?=
 =?utf-8?B?SExOeDRkNkNsWnQ1U3BiZjUvVG1Ocm5xaFZIMG55aGpKbkp4cWZUY3d5WC9t?=
 =?utf-8?B?TkJldXRaTmF3MzltNTE3VzBMNGJwbkwvWlJXeGVXQVExZm5YR3h2YTc5bVdB?=
 =?utf-8?B?WlBOMzRkNVBaSW8xWU9oN2h0R3R3M05OKzY1L3hTSGsvaU5WWFkrV3pjdFpr?=
 =?utf-8?B?c3F4ZXZsUjcwSjF3Z0o2c2t4ZVJFYm4zNzRhWStqQzU0dWdPbS9ma2FkUURr?=
 =?utf-8?B?WHFHdE51MGUrNHpXb1NEWjRrQUQ3eVpHRHBBWm83TWExY2xnVmVHdVNyTmRC?=
 =?utf-8?B?Um9KWi9QaUJvT2VMZ01MZDBsWndDeHdkZ2lYWFVsd0dzaEtRTUNyTVpwalQv?=
 =?utf-8?B?cUd1Ykl2VnU4SGpXWWJmc0QzcDJ3K2dRNTRCOWdDbFZHMjYzUnlzSmZ1SVNZ?=
 =?utf-8?B?d0I0MnlMQ1I3QTZnMHR5RGIxMmk4VzRaelJSdGVtcVJ5am8vcnpuN2NkK1Az?=
 =?utf-8?B?cXlINDhLUllydnNrSXJCQ3lUdmNOYmhWUDAyODZEeGl5QXdFaFVtTUp2amU1?=
 =?utf-8?B?OVVYWUZiRlZkZElERDBEOWJxbkxMdUNvVVNzT1NDcnkzRVZHNWVlaUh4SFhZ?=
 =?utf-8?B?Vk9OYURyV28yalp1RTJDQ3g2WHJqaUlUbDRyU0VqYTJGeGhsa3NxUmVZUUZa?=
 =?utf-8?Q?XW+Q9XfRUQcr3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2FyRjJvSW5wQ3VxYjVBOVFCV2JMQ3Z6bDNXNGRRWWdlV1F3Vms1MUZ6WXdT?=
 =?utf-8?B?bEplK2M0YXlJS2Zyby9JZ0hzK01Yb2FNVWxoSThLOTNZV1czVUgwZm5YM1hp?=
 =?utf-8?B?TVJBOUN5NmJoOE5oWmcvekZTc29hckhuck5sYmZvN29ybmZXTkpNVzQ3Tnov?=
 =?utf-8?B?WHYvS0NrMHpDMit5R3BDNldPYzJXc0lEQWQrYjFGK3l4RllOZ280MGNMTmk1?=
 =?utf-8?B?U3RLL1kzY1RqV1R0ODMzeFV6ZVlCU2xpaGdvYmJ3T09vQ0p3SnlwV3NQdVcy?=
 =?utf-8?B?WjcvNDdlRzBxS1lIR2V4ampWcUw0amxOYmRYRHZuT1BiaFBWTnV1UWtFMXNL?=
 =?utf-8?B?OEVSVDhPNWM2a2FhQStkNDFHQS8zMU1OU3lVQWZzamkvcC9oSzgzdmtQR082?=
 =?utf-8?B?K1FrV3pJRXNLR09EQjRkZW5icDdCeG53amlsTjI3NWFENXhZSzFqaVFPSkVV?=
 =?utf-8?B?Mlg5RENpZGhVMnoyem5HTSsyK1crVUFnTVRVT3lCcmkwdTdOSEplTitKK3FO?=
 =?utf-8?B?cEVhVzBDVURkenBIZXNwVDhkNm5udnY1SzJPamNqTVZLRW9aR3A5ZWxRcnNB?=
 =?utf-8?B?VGhrUFNXbHo0dnIrMDhiOTZKL29ra2JpeE5jOUExNUhnTnpsUUViYzBhUnpa?=
 =?utf-8?B?WWxnMzNPVnRERit5OUMvV3E3MWZDTk5KM1RIWVlaY01GU25rTnpONWpIZjJv?=
 =?utf-8?B?TWJkL2pYK2RESTZyWWo2NlRrZzE2bm9YMGpBeDRJL3hQOUNoNFh0YUlLZGMz?=
 =?utf-8?B?QlR5MFM4SDlpWXAyTlpkTUY3OXhmeWFhRis1RitpbTZ3bGZHaDZuOG4wMmpB?=
 =?utf-8?B?ZkQxZUR0NXFFc29MOUtNU29UT3lBaHYwOXJrdDFpSHhUMEVNbXRSMDVRSFVU?=
 =?utf-8?B?QjB1S0ZyTmQxRStJYjlSRzY0TnBxZ09iRkRiSWZSRURaUXduaUlxTklydVVC?=
 =?utf-8?B?aTRRU09GRHIyN3IvYWdldzNuQTZxa1Jtb3NrNndjdW13WkJzWERlaFdhbWVJ?=
 =?utf-8?B?VFJiWS9FTEJIMjBqekJKOWlDbDI4OG52RUdOVG1UVThaSVRrd2YxeW9kNitN?=
 =?utf-8?B?WHlUOTU5aGZJbnNLdG9WMGV4RUFnaUd1WWJUdjBqdGhzMjIwNDEyZTh1WHND?=
 =?utf-8?B?UFlROUErbzlFd0owTFo4ZHRraG1IL3hxUGhVSVROOHJrejZvWGJyRGlkWGtp?=
 =?utf-8?B?WHZQM1lGbzdXUHpjL0NVWWF5allpRmNRcmZpdFNDL2QveVpLYWtuVVlPc1N3?=
 =?utf-8?B?Ukkra3VuYThBNVZCVmNmdmE2T0s2blFIYWsrNzBzWHYwZlNtT1RmWUxzRXk5?=
 =?utf-8?B?T0pFM0lKQVNzWjczOWhWVjJXejFCOXIrV2xqVldYRDh2R0taMVB0QjdreDVz?=
 =?utf-8?B?OCsyMXFHQkZSdDEvOXoyUW1FOEJ0eUs1RUliLzdGWksxdi9VTzNKdmpEaWdE?=
 =?utf-8?B?aGtrQXhLYmF1ZGJZOC8zcHZuR3Q3V3g5cEtLZHNUWVZZZXNyZnhuWkF5WW5N?=
 =?utf-8?B?ekZjRlJpSGd0enBrRGVGMmRLTHY5aHNUclFkbDN5Yk5kZkZDdG9pUEtGMWN6?=
 =?utf-8?B?OElHeGdYT2RzYjJMeWtzZDR1a1Ryd1h6M1pzV0h1Q1VabkIxNUJVdmtKT1VZ?=
 =?utf-8?B?SXRLQXpQNjZZY0hHb2o2WkExZm1QYm9JY1ZvdkVIVGJqcjBQUkpiRHhMOXRv?=
 =?utf-8?B?MUx0Z0EzYnJxWkFNbENMUFN5WW5WSnBQOHpwTzhZazl2ZGhTZ2F5NmtiaGdM?=
 =?utf-8?B?SjBVekhjaGo1amM5Q3hKdE1BWi9uQVBhL1NCdkpOSVR1YWpvVkpzclVMbGhI?=
 =?utf-8?B?ZWFIYkJmQTZERG5GT3J2QUhIWHM0K1l3bU1tWUpibXZSSVUvRjdaWWJIQmJD?=
 =?utf-8?B?bzRDajZQMmhJRFNrZmlTanU3eEpNcFhZdy82TUxuREtRVmpPOXZoUTB0dE0z?=
 =?utf-8?B?WlJxbDZONWhSVEtqQ3NNNXJOZ28vbE03V1hQM0dhSlFCbENtM3A3TGN6K3dj?=
 =?utf-8?B?SHp5cUp5Mk1jZmNEemZJcm81SVlnME9FWWtON0xqNzZRR2Z3Si8zMkRMaTRt?=
 =?utf-8?B?Tithd0tJOFlCWHZUTFFQZEhOSFNsQnN1ZUluZ3pFYTR4aEwwVXpVYnRURUxl?=
 =?utf-8?B?RVlWUTZ0cS9mOU9RV3UwOEtVRTZtek9zbGtad3FsVE4zWHo4NkFGbTRaOE9J?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4db9d7-9cc9-4b59-2034-08dd51ca4269
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 16:18:49.6972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l++icx5SGkbjYThutAkrOzYIT8wrcnQqvfwETfBf8kkzjYyMXXAB1YgITS8Y6yIwHcJxfNqsH5k/68UXh0dhAbqvq9mcpljFNOt+k0fckzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8213
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Feb 2025 16:18:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6422

Hi Antonin,

On 2/18/25 10:11 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Convert the png file to an SVG file, and add the UNPACKDIR reference.
> 

Not only that, it seems:

- -${PR} suffix is gone from ${PV}-${PR}
- ${BPN}-${PV} has become ${BP}
-

Same as previous patch, the arrows in the build directory are misaligned.

The arrows from the do_package_write_* tasks started from the green box 
and not the surrounding border like now.

Cheers,
Quentin

