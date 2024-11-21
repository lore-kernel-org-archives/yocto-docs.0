Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2A8D6ED29
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:16:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web11.10320.1732194980304539831
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 05:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Wvcp0RNA;
 spf=pass (domain: cherry.de, ip: 40.107.20.76, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aU12nDjMKvhYvg2tI8dttinzpdLPm24LI2amp3VAXw2r3ZJ0hi5OHdwz2m73kjZ2sf8EiM3Ig/FwZRYTQfwodofdWXFqjjZBgFRPv0ZH6KxYm1KOe06txjBkX/ET96hx7YiO4jihKx++9G2AyKmSOR1H9JHBR+1HMKzQxbzqF1nn+2Dj7VQb2bVKb3/CnQHWXhtmV64I8B9qznqKARrCpOoCHRtjjxQ/97+CpYBk6dvFmV94ZfY7zmdUIfyZLOM77bwrgo+23CLsjHiQM/V4Y0kCwt25dpctoIVuwfDWh7h+dX6j+4PRu9d0EScjTYmkDjeKSyFAjUVsRqhl4oha3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rz788kwvIcODOK46YKaocZwxZ6p/KCYowpEwc26h9MY=;
 b=TvoqPN24aMVzJRtFUaqCniVw6/x3FoEzrar7iEkX3Gnryvbye2626hIykVs9L5rckBS0xCnzjf5g2BuvzO+jSJLimllFORFd5xVcpkltkYVMUwmtKq8ir3WVX2Kk9tJLLANpu9XrrjLSF4WxX95ncDqw5Hq5G9xxgayokrdd+b+Lm9LF3ju70JI7sCKINHjaOEABJtsmdB7QddwtYh9ewN856MUR5GEHegHaf3wBtFvlR8Yw+eT43evVpIeN4Gpk/j3oHUPRQ1egDVTdb1MSMzLjf15tcpC0eTJdQTQGLqdu2RZ7w648+vT22h22l04JiWiLy5tYxavFsBu40kNjKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rz788kwvIcODOK46YKaocZwxZ6p/KCYowpEwc26h9MY=;
 b=Wvcp0RNAerSYbIXFpkfzApuCYvIpZyG13n9PWOgVUMUaX6OFz5Z2w05siff9md/p/zMa8GqxZDy03JKzvHKmuUlKYVWoAbQObtX299i7U5g3Xu1e8t2Uq4zRr2yAwj/M2zWhyaF3scvuVw3yijqfcQkFgN+NJMpqusSt/NoavI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7771.eurprd04.prod.outlook.com (2603:10a6:10:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 13:16:15 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 13:16:14 +0000
Message-ID: <adc67d7e-8098-443e-a71c-8cbd50de3ac7@cherry.de>
Date: Thu, 21 Nov 2024 14:16:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] ref-manual: merge two separate descriptions of
 RECIPE_UPGRADE_EXTRA_TASKS
To: alex.kanavin@gmail.com, docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20241121123227.681233-1-alex@linutronix.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241121123227.681233-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c004936-87cd-4df5-3030-08dd0a2eacf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2dxaURJeXNQQjdpeHdMY2pVcnMraFpsanF3Y01QLzZ1SFcyMGdKd2szSVgw?=
 =?utf-8?B?Q0VWd0Zvb1I0d1BOQ0xBOXJ3S1hMRW9pM1UrK2E3dE04eVFJSG5kSFNLNk9W?=
 =?utf-8?B?OGRUUllaczAvcWpGVjNYUTZZZGk1Z0ppQVZKb28wbUM0L002UmVCYkk3elZY?=
 =?utf-8?B?YnRZZStKL2VrZkV6Z2tkWGxlOXFhRUNlMVNzRjRGb2JKNTBhMURHZ0dOQjN6?=
 =?utf-8?B?dTJ5cWpCVGZtNWxUTUlRRWlCblIwSUNMMjVMMjN4RWJjS01zNGgxQ2t5MWIr?=
 =?utf-8?B?UWtzcTRqZHVuTzJBVzQ4TU9LSnBXdXZiVURTZlJGUGYya1N0SjdZNnkrVm00?=
 =?utf-8?B?U05VMnkyWWJ4S0huMFpWNW4xS0ZmMk1yQlJXWXFYVVJ2dEhiWk9SMk4vY0Js?=
 =?utf-8?B?dzFmcnVQN2tsVGJCSExsYXhFT2djS2Rkb0p6L1h1T2lNbm5ZYUlMU1Q4dmc2?=
 =?utf-8?B?RHJxNTNORFJQcEhMaFFpYlZzbnpsMkg4ZzJqZkxCeGI5VHFnS0lQNHRsa0NH?=
 =?utf-8?B?b0l3RGQySU5UdjRsQVdGOUI5S3RrVHkyR3hpSGFEbURwNGlxQVBTbW9uNkxs?=
 =?utf-8?B?azZmNmtNbW01bDFnYmQxRE8zOGx1eGNGallIdW1admFGeEVUK29BbVkwb1FZ?=
 =?utf-8?B?SkdROUpyMEZRTGVxblA0aFZmSXJDSmVtMFNYT1pkQTRXYWJqbGIwQVkxbHlI?=
 =?utf-8?B?OGpJc20zaFovRnFTUlBBVVlkU2RmNGtpdmw5OTQ5L2tjVERxMEl5TWNjb1d3?=
 =?utf-8?B?c2t3dnBWOEdiVFJhZE0zSGFTUXF6OWdUbEp1WWRkeVRlRzEvbVJQUENQNkVa?=
 =?utf-8?B?SVpvSTJ4QlFMYTFiVVAxT0NhQkw4V0pVbnA4OG1MaE8yNUtsKzBkamxLdytZ?=
 =?utf-8?B?TlhjY0JlVjBXR2xTU1lyRk4xTnIzdmQ2WmZLaUlwbGVqbHo0cW0vUXRxS25G?=
 =?utf-8?B?N0NGMytqYnB0QUxpM1FIM09yMlM3QVIvV3VoTU1lWUJ5am13UVR2UVUvU0Zx?=
 =?utf-8?B?RU85dm9rUUIzLzNtTlJuZnVIZnl3RUNwbTR5ZnM5aVBCVk80S2pRMlduLzZW?=
 =?utf-8?B?Y3FvN3U2TnIyckNCRlVicU52MSsxOW8wQnJGS3ZDWFRUK3pDamNRWG94a1Y1?=
 =?utf-8?B?SndwcURkcFdwd0x3Z1lOWVJTZ0crUGNWMFhvY1RZWTMyd2ZHSWV0WDRQY0Q0?=
 =?utf-8?B?V1gxUjZjNCtGY0dIZkpVZXIvaTJCZnBvZ0hIVlZ0N0czeCtkVytFZkV6QzZw?=
 =?utf-8?B?KzhVNVUxajlpYm40Q2lMRFk0ZmpMOXhYQ0tKNzFDcDNoR2FJZWM1QUVia3Nr?=
 =?utf-8?B?b0tjNzR0ejU4RWhVNXVob0RET2k3Zk9MUVYzc3ZRNmRSOGpHZEhuc2dOeHFW?=
 =?utf-8?B?ZWx5eTh4ZFRYTFgzZkNDUVY1VTNvQU9PRnd2enZ3eGRnVzd3ZnRWSXZMMVdB?=
 =?utf-8?B?UmJUMEVaMlNCMDgwajhQNVlGa01tdEJNR3kwclJEcVBYaXFJWndJY202cytz?=
 =?utf-8?B?bFhTdFkyQ2Y5bEd0aWlqKzhnalFvR2V0OGJyUjlXYmE5eklvaEdBUi9kamNX?=
 =?utf-8?B?R0ZBNGwwUXF6TlNzMlJlaklRbTVweUJaVjRtMUtLSC9CMDlUME1LOEtPOUNM?=
 =?utf-8?B?dWhXeU9qT2trS3o0QlhlcmtETzIwcHVaWTh4RlhqRGNyemUwRkxCbXIxM2tL?=
 =?utf-8?B?Mm8xR1pDNlpjc2ppRlFUTmE5Vy9Vb3lOaERHS1JtZVhkeHVWOFpERGNPNWhh?=
 =?utf-8?Q?SDWOyj1widvyZAydOFoFsOCZaahbUtToNBtabIW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZDY3NlJHRG1iVDhvUzluWTVMQUE1cDFqTFhxNHU0VkphMUFla2szM0xyVnJX?=
 =?utf-8?B?Z2RWVWoxejFkRmFiQ1pjTng2ZmlCS0RTNGxvYVU3cFVFWHBmSWpEeGVCakt5?=
 =?utf-8?B?UC82VVdMRTFNYzNQV2dTVDNWUEpSTUJJQS9mQ2xDVUNVbVNzcXc0c0JJMDRI?=
 =?utf-8?B?Q1hnU0grVk5lbE5aSEtwNmpPOGg5a0xlejUyZ1llMkVrTTF5ZTVvUE9NUHVQ?=
 =?utf-8?B?UkFhTkk0aTB4ajRzREYzQklmUVhyQ3kwOXdSWVh4YWhmMzJmUGhkcDRDM09U?=
 =?utf-8?B?d3hsczBSUGJKdG5MYXBBdnQ5bTdJTG1ETm9XdG5yeGRyWW0xaEJ5N0F1Y2J4?=
 =?utf-8?B?MEtUSTF0d2xGRDRtbTYyK2hXQmhxZUlhR3N2cHFaQko5d0tEZ0dDWXBHOVZU?=
 =?utf-8?B?blZ3V2lwdFVpL1gxbW9rZHBBVUg0aXlJYmFrRFI2MGxPQmI4OXNJbzdrUnRu?=
 =?utf-8?B?UTZhNmY1VU5oZWhLbGp0Wm1qOHFRWWQxUitZVzNUMnNqa202MkZSTEE2K0Zm?=
 =?utf-8?B?ZVU2RkN0OFp6bjJaKzlNeHYyRnR2anlnRXJyNjBtTy84dTdZTVFtcEhPVGdm?=
 =?utf-8?B?YlNkZVU0Ly94MWlnaFpYbWxlcXN4YnNxcjVLeWcvcDc3VnUzMUg1LzBrVFVv?=
 =?utf-8?B?UHo4T1hRa2c1eEZ6bnY0WWF6QUdZdm9xUVA2dVBrby9DcGhvVUkzYU9Md29O?=
 =?utf-8?B?NUhuakZHRmxRM09TeXBzSmxWVzBVRjIwRDJHMEdYUElNUHVGb2F3b3JJWVZ6?=
 =?utf-8?B?a25yb0M1SUhPdmVzVnhOVW5Ucy9uemNsZHc4N1B6QURBbDJMd05pa20rY0lF?=
 =?utf-8?B?aDNUVGQvYnU2dk9sQUV5dnhhK0h3akpTQVBxMEJuY000TDk3NXpWRkZpMnNy?=
 =?utf-8?B?MVR6VytlTDBibU5GUWg1TTFxcUpjeUc5WHlUMS9lMUtZaGMwV0lJY3NGSFda?=
 =?utf-8?B?U1l4b2QwcmRRU0p6eS9LQzhZL3grYjV2S1A4ZlhFckF0dEYvYmdSSlN4d2Nm?=
 =?utf-8?B?Q0IraVhOVWFORy8wOUZVWVJ4SENyNGxlMTJ5VHRuOFZ1OVBTWTYrY0FSUlJa?=
 =?utf-8?B?QlBrQW84bFdqTTc4TTZab3orU01YU1lPdlZ6TGtycXQ0elZ5bmRvN0VrSmRl?=
 =?utf-8?B?ZlQ3SS9EeFJHQlFocW4rSGhBY21HelVINWlCN0ZXSWRFdm5uR1lhMlRUc01Y?=
 =?utf-8?B?SGhNZEI2UiszM2ZUL3VNemRpUUliUEpIR2ZVeWNzbUpkYmFPc2x1eWlISDhB?=
 =?utf-8?B?d0FOdDRDMEgwZVV0SlFYK2hqRWVZTWVqRXY4WmUvaGhqdTExTTFTaG9BTWF4?=
 =?utf-8?B?NVdXWVNIZ2JBSHZGZ2NLYkU3czVETXdIUWpOelhyazkyamxVOFVRNmV5S2Ur?=
 =?utf-8?B?Y2xEL3EzR2Evb1BLOTF0VkUyTVRmMnViTFhXTTZhZjM2V1JlRnRRUHhucnpp?=
 =?utf-8?B?VTJVWEF5UnZYdWNlWFRQUnVobWlBMHVpcG5jK0NWM1ovV0dwVDRoVkk1bkVo?=
 =?utf-8?B?VkJwU1FYSm9VcnVKVlkwQWtnZmNpcnNWcnFPZWxvRVp0cmxwaEFGTXNKdVI2?=
 =?utf-8?B?L2ExaFlQckhxcVBHS3lnZTFYM21RTzJoUWU1cDZRcTJSdWJKVjV2SnNlYVVJ?=
 =?utf-8?B?ZnozOUxUb2UyekNBdHhuekh6K2hkVjZQdGo2SVdlbFJCYTM5dlpxUjlqc0tP?=
 =?utf-8?B?NElYNWFmc1BEcTR3NWRMNVZvUDNvaHAzUnVPNzFVbFo2Mk1nbDM5aVlXdzdz?=
 =?utf-8?B?V3JOYmhuMkVPaENObzNxczRaUndLV3dUcmF0U0JVcEwwSUZPa29sdFIvRm00?=
 =?utf-8?B?bzhnSTNBemR0bTdwTVIrMmhWR0Y4bW5rOWRyeVRmUkFhemJ0a2N3dzJoVnJ4?=
 =?utf-8?B?aUV2N08wNDdpK09QdE9rSnpadUx6WWlDUGZTRWVXRURRUjZPOVd0VlU3bmlJ?=
 =?utf-8?B?Y0pneUNtUy8rcjRLTXdDdVBjU1VuaUt1MzlubWI3c2o2Q2VmVTVueDRqeUZ0?=
 =?utf-8?B?ak1INU1waGVFbHJ2bmJFNDNjV2tydlREVGRUdmFkaUdoaGxvWE9HUXozckRq?=
 =?utf-8?B?WnphK213NnJTTHVUQkc3SDh6UEd0NGpuejdJbDkrZjZZZ3R1ekcvRTRJZ2pa?=
 =?utf-8?Q?DyPgid7tt6Cpgal5rZhUOf6oW?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c004936-87cd-4df5-3030-08dd0a2eacf5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 13:16:14.7434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynKUVJpzQlrv6GaP2u1ga/sVAqGh59cQX4MNsymBRJZx15dbkgUtIivsXLXGYmbLGnfUc6zR2Ag57O1aNvI+ZrZytKc8ZZNvQvdZNZRKDzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7771
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 13:16:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5783

Hi Alex,

On 11/21/24 1:32 PM, Alexander Kanavin via lists.yoctoproject.org wrote:
> The second description was added due to confusion over the variable rename in oe-core.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Commit doing that rename in poky: 18e4194539f33e4d702144ae7ad92875f0bbe41b

The introduction of RECIPE_UPDATE_EXTRA_TASKS was done in styhead and 
the rename as well. So candidate for backporting and no need for an 
entry in the migration manual I believe.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

