Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B762CC9EC93
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 14:13:43 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33511.1768227215444322429
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 06:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=jnX6U0RH;
 spf=pass (domain: cherry.de, ip: 52.101.83.70, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkqcMI47nYQBMAhDzLW+d2mKXVaPHAE/5KudU9v/JcWOrw8QjUtkOadnMYlQ5vRKoA7IeDDYjG0QKdGB+COWnbOrHgJCDjuYzhtdacZOomAKajVlH8y3yOfQ0hi3Q3Nl/8P6c136hSYcPYOM4musa+LzM9vvRaliGyt7Lb7B9T4viy+9jUUmW2wL5f4sVak39CQlNW7rA8fTpoyX3Mk5k1e51XrXuSMg4fnO7OnI3KQCNvkGoKtY3E4I95wUOLqj+XMnVajOQLFV785rC5jLNMYS6NKhpt0zGfJ9X3ZKXvHTCt1q3eHpyeOcqVWqvVOi+dQRh8KS1l57MTg/bNcjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzI+X4TgmsRDqKUTBP71GIX2q6x+oRsZyZmKaMST964=;
 b=yemAgtsuWexs0DYy8zLIREvXUS5puKEbqWalCC1KCo1We2KhccDpLfZKKiR7jl0+7ID/+iqfaT7vjlWF7jNO0rGAuYginxaOtOZfthl4RWh/7/60V1W1rxzC3EOp/moU3ewolSAh1A6+SPCCzM3tdOssIjLkfDxzl01xR+A8WecXsxlQpuKCIxYyb5VHENDM0zd0MPk4xvddAP1eJrnfmGFbRsT69slUbZsXLwJMkdnuUQELvKyb3XffObqHeGFbpm5Dj7X8FYj5ccxrjuZztddzvMsVf3Ip8mat0r8T3XLAP5YGSn46IGG7UGmTkXcvwtYwWgvmN4H7CA8tYgYcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzI+X4TgmsRDqKUTBP71GIX2q6x+oRsZyZmKaMST964=;
 b=jnX6U0RHE3VIuQxYTXWAaFjcnioVq0cNjwa3zpUAD59CyHPcmmSvX6JXX/q6WVpJNdlew+9b+k6u/eN5Kyl5eSCrpo+DYTwiKzxVG9sBQg+PYbJ9SLd5dHhYLNrzL38xipBBbjcAjjYES4pJwtU3U9LVnMAGWZo5mdtUotOmyq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8175.eurprd04.prod.outlook.com (2603:10a6:102:1bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:13:30 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 14:13:30 +0000
Message-ID: <4c7492bc-177f-4bb4-a8f4-cc19323fd242@cherry.de>
Date: Mon, 12 Jan 2026 15:13:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] why is "configuration fragments" in monospaced font?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <7dbf2502-1403-3451-ea27-45aeae758032@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <7dbf2502-1403-3451-ea27-45aeae758032@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 01133799-9e7b-4fca-05a9-08de51e4c315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TFNvY0dmbEhya0ZySnVjVENKc0o3aG50TWpPRU1CMTRUWUMxaDRmZlo5d2RP?=
 =?utf-8?B?SVJGNTZ0VUJUeGlpa3JHNkkyUWppL3ZuT29iTlpXZHRMb1dMMTFvakd3a1VL?=
 =?utf-8?B?b3RZYnhDdHNlNlo5T3hZbER1ZXV1Q3kvTENGRTlYam1Hdy8yajhLWktScWxz?=
 =?utf-8?B?ZXp6L3dTdzJnMnNPMkVYQjU5MzkzditWdGl2TEdhaGNRWHBJUEN1V0kyL2VO?=
 =?utf-8?B?VzBaNjFZVHI3MVFLSU0wSHAvOFIzVGhVTUZvdXF3RDlpcTBESXFJLzd5Rm9t?=
 =?utf-8?B?enBIWlE2TitPRG8vM2ovMjJBTy9melhEVXZTVWt4QkFiL0hLU0VTN05NclVM?=
 =?utf-8?B?bWNYT295dU9vclF0NzUxRkRoNC82emw2SjAwbUpjdm1iNVQ1M0xYNldyMTJX?=
 =?utf-8?B?ai9HeGg1S1kvVHl2RUlXVUF3TDNndVc4b3RQcloybDNDUTNiNC9aRHIyNUw0?=
 =?utf-8?B?Q3ZpbDJYMENaOXJCTXBjdFZVdTYrVzY1TDRuWSswZHpad2tkT0Q4bmV2NXov?=
 =?utf-8?B?R1JneUZqck5WNVlVdnNFN2RlWHluZjNiWlBFbDRzUENEVWFYaEJGQktaMTBI?=
 =?utf-8?B?NGxoSyszMlZVSFR3T1BiZjUxdGlzbUtGaFVyMnhYdU0vOTdjY1EzTjdDVjR1?=
 =?utf-8?B?RGtWOWE1WkMxRkkyc0FRT1VPU3VNU2lMYUh1UHFQblpHMjgxd0c1TTJscXV3?=
 =?utf-8?B?TEJ4TEkrOGRqTGNMRVR3V1VCOHU4djhIVHh5TXNLcnNvZ3lxdkJhblgydGlK?=
 =?utf-8?B?TE12R0ZiakU0bFBSVmN4SDJOb3NvZGErak51VGFtUjNDZUNKYW5TdStsMSth?=
 =?utf-8?B?TVRCTXZTWkY5SkVBRWxIeENJbGxJRzNHdXVySXozb2RLeEZBVnZyYVRaWEpa?=
 =?utf-8?B?R1F0dUFjVFEzSzdxdHh1UzVTbVJ6MVF4ZUIxS0gvT2RzODE4SzZJdG1wM2R1?=
 =?utf-8?B?ZHZadlkxdzFiT2pOM3RIM3VHV2tEdCtFc2J3QzZXWVA3eWRabnh3KzhyUk16?=
 =?utf-8?B?ZWhuUjRvQW1sRTUxZWh1dGM5eE5qb0xlOW9odzVUSlVESFBldldqd3JsbDVJ?=
 =?utf-8?B?c0xaQk9jZ2kzMUNqL3JaeTV4VXpCUWozTnF1dlF5ZVBpOGlvZ0VoNklXYVEv?=
 =?utf-8?B?TU14bExhSzJLWitSK1U0cVhZYmprVW80N0poQS9IdmJLdzJPSnRNeTNGcGhF?=
 =?utf-8?B?SUZsZm5PM1Rmbyt2UmRBb2xZaGtWRGlrbzZFeGFiN29sMWtzckpHOVV6R2kz?=
 =?utf-8?B?cjFacVJzRGhkZVE4REhCOUpHV2gycnJQS0F3aE9HaXZpRmMwa3ZBRnN4RWhu?=
 =?utf-8?B?c0ZsbHRrZ29pWWpHTE5MQVFoUlE3anRiRW1qSmhibG1MMlQrZWF6RTk1MVJP?=
 =?utf-8?B?L0NhdGZuVnNIYkdybXl3MkZDSFNPVTljVmZJUW9CUUFnUDBjMk5XL3lKZ2RG?=
 =?utf-8?B?c1dYVWtOREFpTWxIWnFjRzBsQTMramZ0dHpLZXlIekN1ZnE4SUZvZXlUMFcy?=
 =?utf-8?B?M2xDVU91Y25EY05TLzFUWVArVDBvVWtONWRNV2pkdEo3RlNpZTVGeHpnaTJu?=
 =?utf-8?B?cG1xQXIzOHN2bXBBdEtSNkdudjlyQ1JydGgzVU5lVThqcmk4dnZwN2pnKzlH?=
 =?utf-8?B?dDZodTdkV0YxeXBqK3FySFc1bXpxQ3dRTUZMTlM0dG4xR1BjaHJPL1NaMWdF?=
 =?utf-8?B?eHZQaG9uNGN4YlZSOEZUYlhrR2NMU3ZoOTA3bzVRczlxanltaEw0MHZKZmlj?=
 =?utf-8?B?aktuRjhsWUJkK2lyYnNSY1N2REVtZkw4NElhemNsMUl1YVFPODBZV1dsbldh?=
 =?utf-8?B?azUwVFozQll2U0pvQ2xIY1FOclpBbVVsMkhSd2pyN3VjKzUvOURGRzkyZzNp?=
 =?utf-8?B?Q2NpcDZ4d05tZ1J5aUtHUVo4Qmx4RDNrSFBrRU81UDU2Smc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YTFVTjE2eVVNbGowV3pkeHFpUC9lZi94ejhiNXZKUE1tU2JmbVFrSGJnZHZh?=
 =?utf-8?B?RmJ6WElER1JDRDRTSGsyUnFXTmVXbzZMUks3RVFFV1Jrdk9NazhVUk0zMUQz?=
 =?utf-8?B?VEt4TTFZdlhkaGJOYWxDODJjSjY2cjJ0VmI2b3pUaWsxS0xCVVBCUEh0YStT?=
 =?utf-8?B?RWk0RGdCL0F3QnRqU3F5TWY0cVdoV0N5KzRZT3FZTDg5UytyN2dVL1BSN1Zh?=
 =?utf-8?B?MDg0a3JWWTFyYVlwaEh0TEJ5VDE3QjZ4bmVDVjk3bTllam15cmQ4bHdKc1pS?=
 =?utf-8?B?c25Oa21uT0JRbFdrcjhDdGZ4b3dXb1JhZ2p3bFhDTDF6ZXRabXliWjhJZHVX?=
 =?utf-8?B?b09kMmJnMmwvL2FXWlk3M2xDQnk0MURYSE5EcUNsNHc0S2tjb2NrR2ZFNWo1?=
 =?utf-8?B?dXhOR0NMcWpvNjQzNEhSaEVuUlRPNnJUYXJyV0oxTnRwT2MxZGx6Q25rTXdR?=
 =?utf-8?B?anhEYnljaFgwa05uYkJrc254TE1nc1c5N0xiMjM2YVVFQnZUTnNGUElobENJ?=
 =?utf-8?B?L3QzZGtqUDBaZVp2OXFTd0lKQWtXcVh5eFVWVVY1VFV3K1VEY2tHbkxFck11?=
 =?utf-8?B?a3hPNXErd1BOU05JaThyTDRQdHk3OUFlc1U5bWR3cGdtZ25Yc0gxZGpBUEZX?=
 =?utf-8?B?NGM5VEFpb25OcjFiUm1xMTRTY21EZk5VSnZWWmkvVkhTMTNSejhEZVQrRFBC?=
 =?utf-8?B?OC8vbmZXUmFZbVQ5L1RHbEEvQmlqZk9rNjFUMEJOVUs0cVNwSzR0cCs1b2F5?=
 =?utf-8?B?ZlcydEM2WUVoL2RsUm9GUi9tNys2ank4ekpZSW55c1dnd2N4NjFlbkEvdmhr?=
 =?utf-8?B?a0srYktqeDFCUTVUdHkzdVR0Z3lpT1dRL3F3ZDVJZmNZWm53TmcxM3BYaDVy?=
 =?utf-8?B?VEpHQy9FNVdPdTBaa1V6b09meE5qZmRiU00zbUlmSTRueUpveW9HV1J2QUJQ?=
 =?utf-8?B?ZzhNYnFsLzFBZ3pBMlN4cGRoSWdRVzI4Rk4zQjdKd0d0TVREbjhINkVxZVdB?=
 =?utf-8?B?SjNuUyt5YStzSXdWSnZhQjRDbUI5a2ZsdDh2RXFtMXB0M2tmRzJocExJM0gz?=
 =?utf-8?B?Q0RNRzRtNWlGSGJqSW1HRVR5WjljSHZTQ2R6LzMzVkx2VlBTK0E4SmxMQ1ds?=
 =?utf-8?B?SU5Md0hYTk1Xc3hhY1lNOFF1YzIxeitiRGk1dVVuMlZZbWpPVUJxYXFKNHls?=
 =?utf-8?B?RzVKNWNyZUd6QmJsMnpOUHFKT3pvcUtGT3hpbmxIOVRpR0V2OGcyZWJLNCt0?=
 =?utf-8?B?UXMvaURObW9RZDhCa3FrUlVERlJVTUpxUHQ2OGxyaTNPRlFWN1pPcmdXUHd6?=
 =?utf-8?B?cUxvcHhhWm5YL09RaGcvUzBZOU9xcFdMc3k3SVl2UFlxb3g1aTBZWmV0cmxF?=
 =?utf-8?B?TXg3SVhKbTVSZHBjNUhnSmplUnptS0o3cUcvbWNwcWVsK1VIQnpEdFdpN294?=
 =?utf-8?B?ZHFMc0NyeVlJNlpHY3pIMlQyeHBXSmh5SG84REVMWkNEOVlLZmYxYm11SmlE?=
 =?utf-8?B?R0pqbVc0SFNNMFlEZzJmaUVXT3Y1SnJXOXp4V3ovTm82ZDdwQThqUjN5NEpp?=
 =?utf-8?B?YmZ4YU12MjlkMTgrZk1aYTRKb3RzVkUrMkdwWFpDVUNyYjArUGsrVXg3ZUdz?=
 =?utf-8?B?bklSY1NqeTRJK09sS1kxeDZ2T0k0MFB3S0Q2NXlZZVRWZ20rbkZnREFXN3V4?=
 =?utf-8?B?UC93bm9JSEpsbjQ1VWZjMEJJdGw3dVVKY05ZaG5Ld1krdHJLLzVFQWIyMVdX?=
 =?utf-8?B?QmRQZjRock9pdmtsU1NxZTZmeXlmOHBKcTMxWmpyT25OYmNHK1U2VmdDbVlz?=
 =?utf-8?B?UnZNNTVpT1JSOXZka2FtcURSNVgrd0ZwWnRmTFI3VVJkcE1YOHRqQlRTb2pq?=
 =?utf-8?B?TFMxelhaQ2RGRjJPUG56Ukk5Y3M1NDBISjd3a3dJMXRZSjU1SzJpQTROMUIz?=
 =?utf-8?B?SlpSQ0V2QTgwQk04QUQ1OGNaRnNtemJwZ0EvUVpHY3Y5MFBSUzBHMGxqNFpX?=
 =?utf-8?B?YVJwK2d3SkowMTdFM0dYdGN1ZXRPYWhkbC9BTjltcWZZd0NpYzNJMG92dVkz?=
 =?utf-8?B?aGNIQytDa2hrWENibFczMEE2VDJWV0ZBQm9UeU03T0hzVm1QTFd1WlFNRzl4?=
 =?utf-8?B?RnJndXZzTkcwaTVPcVNwRTJuLzRpeVZlWC9meVpLNlJmSU5yQXdHaElQQU4w?=
 =?utf-8?B?VGZMT1RqUlV0RXJEOTBTbXU0U2JGK1hNL2Y1aUJIK2JjaFpWaVVCdkNmMktv?=
 =?utf-8?B?VStOQ1h4UmNyNjFPbGFCNHFTNlJMNGN1cWVDMzJHVkZaMXZ3SzhHMlBCQnkv?=
 =?utf-8?B?OUpna1dvbm9DekZsMkFwMllMelRYMnZxR0ZZYjJZenpKWk5QaitYUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 01133799-9e7b-4fca-05a9-08de51e4c315
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:13:30.1864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POHVQaR46cI8GKEJI3jTno/VgyGJ/5Smbqp8Wn2cklSR8gOtdAujF1nO7AapLCmkcwQosz8AIXVORg8gckR7WggdxIaYKQTYm5nDMFdg2mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8175
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Jan 2026 14:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8457

Hi Robert,

On 1/9/26 12:45 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    more nitpick ... here:
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#sharing-functionality
> 
> last line in that opening section, why is the phrase "configuration
> fragments" rendered in monospaced? is that meant to be an actual

So it doesn't feel left out with addfragments right after being 
monospaced too? More seriously, I don't know, but I wager the intent was 
to make the text italic as to highlight that it's a two-word term?

Would you mind sending a patch for it?

While at it, I think it makes sense to modify the "``addfragments`` 
directive" part with a link to the section in the docs. Maybe another 
patch to send?

Also, this pertains to bitbake user manual, so I think it'd make sense 
to add the bitbake ML when asking about bitbake-specific docs (both BB 
and YP-docs ML that is).

Cheers,
Quentin

