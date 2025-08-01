Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985D8C87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:49:47 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.68])
 by mx.groups.io with SMTP id smtpd.web10.84809.1754045385020173758
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 03:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Kmk+4A1n;
 spf=pass (domain: cherry.de, ip: 52.101.65.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fwr5IHW08Hfj3X98zpx5xlzIxtny0onA0Eo7QtiFFsEUxIz1q2/ZvUnIEMqjxKZ/9oiFq+MgM0hnPDs9DSvnb5OM7YOXuM2/SIDd6fCp3sirl2TWaVVyBPZDEUav6as9dwu+0TegOkh7pd1tSIMAx2VltoV2a8KJrqAbXDCmEUdJmO/Bk94YWlZtCN0XzGgxQ8l9jyMaClgEKajoSZtOau4uFFpKRdA1/aMFPbRM8Iy3itFBDhiDWXSm5c2FhD6jDUImOZLaTB8e1tLyDu0+aC6eSHcTuRNOM/Lvmog5DozwzmOZ9EQZi/qG0ZlFt4GqQPQZbn/ymtxa4tIIvZn9Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0OeANY0eDjpEBgdRUdLCoB/KwX2Pg3MEXzUfW+KPLE=;
 b=jmxYHRXfF9cWiA8fNXuHwMWbBLZ8uqRswCopBT/iE3TyGOCLaLoCBpDDWQVR+80ckQ3KG5MuUGaznuyoxaDy0CqvzKDFClzzRt9sVdQlZe7ZziQFGpS/Az1ZCDf+sEjRIwB+wQEll5zlXa+DZFOH4GYrrYPyfP3ltEHw6ZuQ5i+wYhlUr27ONHehWlV60A25QoSpirJwKFKDvDYfgkKKvgLv0qpmd64Fci/3MAmDCNtD0AuL9qmzpLY7oEY2a0TtDT6hgq78i8Pj4IM7CT3CowVWIpmuedB8z20D4GGB37H0HuztKIgVmYRYFYetbbOieKKNFomJBsPnysTHb0Lerg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0OeANY0eDjpEBgdRUdLCoB/KwX2Pg3MEXzUfW+KPLE=;
 b=Kmk+4A1neTB1lF5fEO05gobQKv+kIgndNm2L2GRX+DV8bnacHuIyOse9Sb5ICeMclJ5bC6U78yrYrYLioYFHDU4tsUeF4r2OLpzdhg9RT6bboy/yPmKzTDqtN4Ij20D2q9X8suEKFG1fqPQjfsRObcboWg7fYvlSwe9CfkWuP5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 10:49:42 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 10:49:42 +0000
Message-ID: <2ff4c7c8-9041-498b-a71b-34c8624d43b6@cherry.de>
Date: Fri, 1 Aug 2025 12:49:40 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCH 1/3] ref-manual/classes.rst: insane: drop
 cve_status_not_in_db
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250723-refactor-qa-checks-v1-0-3a72c751ba83@bootlin.com>
 <20250723-refactor-qa-checks-v1-1-3a72c751ba83@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250723-refactor-qa-checks-v1-1-3a72c751ba83@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0115.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ab618d-6a49-4404-5db8-08ddd0e91f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UG1zelNWQmxsMTI2TDROL1hHb2N3cDNYT3AydFE2Q3gvTEF2OEVpOGJtdDNP?=
 =?utf-8?B?bStqR0xxblh0WFlXU0FVK1dqSWxXQzZzUFZvWHFBeTZucE5SSFhUWmZQQ05E?=
 =?utf-8?B?L2FPVEJTQmxXazBVNXVTU2taZk5BVm5BcnpjVUdnU2RWQ2JxY3ovcDFheFNq?=
 =?utf-8?B?SmZyS1d3THFGWS9ES3RiRHNmVHEwYXcxblNnRlZtL202cXdBeC9IV1hZWXdV?=
 =?utf-8?B?L3FzQ0Z5cmhBM0xUYXFYSGxGd1pqZ1JWSXJFYTJyR2E2enMydDViOCszaXhm?=
 =?utf-8?B?L2NUSjdRK2ZrOUNFUXYzbHRuRFVEdTNKYy9PTnNwRW82Yk1Ceis5WjVhd3pj?=
 =?utf-8?B?T0FrcC9US2VVUHlVMzJnaHZLeFl4Tnk2TkxETHRieWhXQ2FPRDZZTlExMkNB?=
 =?utf-8?B?VlhkWkV4dkg5YmExeWNUcUZremo0cjlBZFE5RXQva1JNUnF0dmd5YkZyZGRz?=
 =?utf-8?B?bFdwenFhZEVlbWZubE9wVHZxQ2k2NUEycndnZUNWQk44YU5wV2dGK0pER0I5?=
 =?utf-8?B?WmkwTThBNTh0akxCRk56bUdHbFJyWE9UOFFKQlZBRTZCOHZ5cEdHMUZKVlVL?=
 =?utf-8?B?WmkyOFVvMzBMQTRoWWZncVg0MFVNTXBvcm5NTUhBcSsxckVVNDZ2S1BKVGV5?=
 =?utf-8?B?eW1NRVoxZjF0emJkVkU0QmpCUXJWZ29IYnY2V24wY1pWSTBhMDE0SXhlREtj?=
 =?utf-8?B?c1RzeERwMGNxQ0ZQRlBlbGF5dnZkZDQvUmdCNDNwcWw0M3lNM3RCSC9rUG9j?=
 =?utf-8?B?ZGdTZ2o4di93emdiRnI4QnpqTDFJTFZucTd5TEtocGhOOGxDdFlPemxlNU1R?=
 =?utf-8?B?S1dHY3BSY1o1OTZGSGFuem9ydmNzQ2ZLOEIvM1BROTlzcm9JRytvbHVzRWsv?=
 =?utf-8?B?ZjhoSEtPUDg0dDl4UC9BSGwrczZQYVZhZXBlcGk4ZVUrMEtBQ2QxWjNkVkdh?=
 =?utf-8?B?VE12WnRyQjEvdnJEdGhXWUFHM1lOelcvbksyeW8vR0l0eFVyb05UZ3gvLzNM?=
 =?utf-8?B?R1ErTGdWOVFkWmpkZUxOQk1LdXZ3VmV3aDJzaXdhTXJySkZ6ajczZndsS0xW?=
 =?utf-8?B?OE1lUWhwU3FQMGJoWmd4Z0dvQlhENVpHQWNYazFtRXV2VFUwalU3L1VGRlIy?=
 =?utf-8?B?Q0kvc1BIaDRNeTVUb1hlMWYwVFdFU2RnN1VRUjhqZTNwMC9WbkpKdWdKT3pL?=
 =?utf-8?B?V0dCTkZLakp2MEw4OWI0NzRLVlkxczhFMlhjVGNzQUR0TDg3Y01MZlhzOG5I?=
 =?utf-8?B?c3VZOERUb1FtZVR6SFZacEptTjAxTDlSQ2wvMmVMZWVKazNWUWZnZjlxeDQ1?=
 =?utf-8?B?dUIySlk0Tm9wNmViOVp2WUlYUS9OUy8rYTZ5cEtOSW5zWEdOUXpaZ0JPT3pZ?=
 =?utf-8?B?S21DZHFXWXRjTjAwUEtWa3RWZWpGUU1jMjVIYXNCWWtmeGV5WnJBRDEvV2FC?=
 =?utf-8?B?SzdidlZzcjhDRWE4TXJZZ3loaDNnNHNpdjJnUWtzSnRzTlAxeEtiMi82WDRz?=
 =?utf-8?B?dytYR0JWNmQrNXA3SitnblNoRHQrN3NPd05nQmlvOFlDTmhWZEJZMnJiR0FF?=
 =?utf-8?B?WVZ2UWdUOFpXWW5aa3IwNnhuV1lZZkQ5UktnUTB1MXl2ZDBZdHdObUlFVTFO?=
 =?utf-8?B?YndwN0Zobm0zampEOFFOY212S0pVQUJBckVqRmQ0MzJ4K3pDMGx1aUtOMDdm?=
 =?utf-8?B?RENKNVQ2b1JiQ0J4aC8vM3BnTjB1cndDM0FuNCtVVE9sQk1NazBpN3hTZ3l5?=
 =?utf-8?B?WUpwS3lrNW0zUWNnVHROYlJ3MTF5UWxES21sZHBqdnZGMEh3SEx2NFNSVmZq?=
 =?utf-8?B?Vy9RcFQ0SDdQdFg4YTVWZkNUU0dQMjVLOWNmV20ySHc4d2h2dmdoUnRRR1I1?=
 =?utf-8?B?eG85cExubXBidGwvOVdSM1R6ZGw3RjVNcmdtcm1BVFZENndZeks5ODNSMkpJ?=
 =?utf-8?Q?bBs0fNwM9fM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1poYWhZVFVlV0xyWHVCaWRwTnBxdlVmNXFzVTRzYzVUeURRaEladUZmQjBQ?=
 =?utf-8?B?OUcybUFoVjluQTFUSWh4NUtRdHJEeGxieU1raGZoczlJUWoycU5aYjhmblU4?=
 =?utf-8?B?MlhRdyt4dUU0RU54eUxtTTBjZlI3UVYrOGU4OTd6UWJjV0NyL2IzajNLb1ZI?=
 =?utf-8?B?MWZzYWNra1JZR0pJVzh4K1NFMHd4U0MxT08rMG5qQkZwemVEWHoxSC9sT2tK?=
 =?utf-8?B?ekVxZGltWlMvYVBueFRoQlJsdmtGSGxuV3lFeXJ5VUNQaG9rZitCdVY1THMy?=
 =?utf-8?B?UG9lWFlnc1NOOXdWTzIyVVdCdWV4R0tPMjFaUkFMeWQrZzRDSCtIL2FFWW96?=
 =?utf-8?B?cFEvU2o4cGJmblJqQm5DbnhOMnZLRmxYL0Q5RUFydmZ0b0RDREFrSVZwY0N3?=
 =?utf-8?B?cW1FMzF5b09wMGZ0S09FTTRJd1gzekRoNWF6QVJPekg3Y1M4MzU1VGRSelVW?=
 =?utf-8?B?MUdQNzZsYzV1byt2cVNHOXN5THNyQW92OUJ5cWIxUG1rOGJEYVFwNlRRdFZu?=
 =?utf-8?B?N1FqMmF2MXd6VW9IWTFzb2dlM1p0bTR6aUNsSmlQUFNoYkpXd1dUTWxZaFdX?=
 =?utf-8?B?eEVrckFmZXFzeDNyU1FyZUJiQkFuZzNzU2tuZkkwcVJ4SzN0aTloaTJidEVz?=
 =?utf-8?B?YzJLZ3poeG44dm1DRXhwbDE2bzU0RUgxekpVQTFhbWVqcS9jd1V6d0dCTHll?=
 =?utf-8?B?clpEcURzNnlMaGQ0SGlwVEFtamxtQ0haanF4TndWOWFudmV3eStPWVNIYk9E?=
 =?utf-8?B?ekIwdjNZWmEyQi9UazMzYmU1VSszL1JpYjZ4UzhDZ2hpWjd1RitWLzJhTk1K?=
 =?utf-8?B?S0ltYWpaL1RGSDk1QzJ1RllIaHgvNVdNMDlZOTF3Z1VUNU5uTkJSRHlLa0pG?=
 =?utf-8?B?SjB4T1ZBcC9vTFpEcWwyd2tseHg4Zm9RSEJ0OTRXMDY4M3RDZEdiZUZBMS9z?=
 =?utf-8?B?L082UVhsVE01TWJBL3Q1NVBpdHJBeWhONDhndGZ0bjIrN1JBUkp3Y1M1cVIy?=
 =?utf-8?B?K1F5NHVSY2tNZTArSy9zSU1hNHpPeVpBemtVdDNzeUgxV2toeTFVWmxSTnI1?=
 =?utf-8?B?enlhOCtPMGExT0FjZXBVZ0lHS0JORkorYXZJVEg5YnF4TWhETXh5OTdkZDE4?=
 =?utf-8?B?WEZjYjlORmlsbDM3ZlVoZFQzb256c1g3V0c0d2xyWTlJT3dydXRoVFhWNTFh?=
 =?utf-8?B?Z2I0QW9TV2hvWVRzeHJWeC9xVUt5NXlMeGowekZrWDhNWEpyWTRIZVVRZ09X?=
 =?utf-8?B?d3l0QUNyNXdvNk10ZjRQb2tRdUxQYTdST2ZZdEgyd3JQQzNoWmtxZVJOVmE1?=
 =?utf-8?B?Y2NRMzllRFptYXB4bzVRc213aXdYbmZLOXZxbFk4SzdaZXVLb2k1SGhKZ2Vl?=
 =?utf-8?B?cUYyQWViRk5sa0FMT2VVZ2NJcWZBcWJwdDM1UC8vRDBsV0VoVityZFhidzNT?=
 =?utf-8?B?Rk9CSjhXTkt4SE9OczJLcHZoUjhsekdZeHpWTDAvRDhkR2JSd3FUUFU0VGF2?=
 =?utf-8?B?ODZXTEt0UDZqL0F1elNsejNoZGZSMG9nVEtndGxOeXRxQ2dJK0luVjBabjZW?=
 =?utf-8?B?c1MxRU10R3pKSm9RamtLZ25pVHZnVng0b0JmL3M2U2VPOEs4NXFDWGszVVRF?=
 =?utf-8?B?d0ZUdTZsZzJPblMwK2FwQW15akV1N1BmTXljVU9NZWI0cU55SGFsU2Z2QWNN?=
 =?utf-8?B?dERvdDIvRS8zV3p6dWt0RWM3d2Q1WEJBQUN0ZnRyRjRFczVuYW5HOHUvV1Q1?=
 =?utf-8?B?bGVMUGRDWE9laXJ0bE10QStCRlJodFhLa2ZhTlcwZEkybGFPUHJ5dWtQc3di?=
 =?utf-8?B?ZVhpQ3JGNGhUeTFBNUNHUDBhRWdHZ0Zud21OYy92QWRDaElzeEY2NXQ5VG5s?=
 =?utf-8?B?YkpRbE5MY204MWNEMEw2eWZqS2ZLdWFMOXFKcEpZMHlmZFZqYUNhYk9JSlVC?=
 =?utf-8?B?QmZma0ZrbkptVjRvY0phZWFaOHpyM1ppRy9wMVEyTEFtcXVSSmhwbjRtd1pP?=
 =?utf-8?B?U2ViVENvZlB0dWZXSmRoVFF6WnZjdFY0U09ZU04vWUhuR3EwUjFKY1R4d0JS?=
 =?utf-8?B?SlZLeGFGZkFaMkk3M0MwVDkrK3g0ZS9aZitKMVVycUkvLzJ2U1RMbmdoeDNv?=
 =?utf-8?B?OTdyQ3BDVURjVW1UektLMkw4QlVFa1o4OVE4eTJyK0lKK2NHcytGUEtndHJZ?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ab618d-6a49-4404-5db8-08ddd0e91f30
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 10:49:42.6953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7daTAL85/XbVym+8KWqbaF73KGxJPvOfV+Z6AuwaEs9qaDNqaKp44MP3kRXgjMWajIspRxmk2zbWlMgJnpfdBHyeTYVjpZe1QlFeSY1VQQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Aug 2025 10:49:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7426

Hi Antonin,

On 7/23/25 4:27 PM, Antonin Godard via lists.yoctoproject.org wrote:
> This was dropped by commit 452e605b55ad ("cve-check: annotate CVEs
> during analysis").
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

I guess this can be backported to walnascar?

Thanks!
Quentin

