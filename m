Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AA4C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:50:37 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.34])
 by mx.groups.io with SMTP id smtpd.web10.84823.1754045434283254196
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 03:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZQiQmLMH;
 spf=pass (domain: cherry.de, ip: 52.101.70.34, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCEx7Gtjy958tjpIfSq7rC/VvJvOCvh+aAytCciQBh6wOHLFnhIbcVw/uxhulqhrdbbne1Zs/aYY/k3k8eBOVVoqSHvm47Vbre6JDx6WMk462p1cOhRTimN6QMiFJtS5XWuODglQSaKUa6vsTWeNjcDMo4e2XLviqfW38eME2KUGe2Qf1Pllehxmn7Y31QgkT0Iqe/V2jg1WbSU9QYM1l5gAupn0bWX1D0667xm0A7rYdjp661mmE2XIHrJxC547zyCEYin8v7cF0f45BtOghHweRXbJOhqxCupTZ2HPWoAzFnvucy7QNGSYRvHPXSlktoAw8XpTTUcBSpm3FnW+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pDf2WQjm/Wvbblr1Z3aLWMdYDO8mSPeRWbRbJy8aAc=;
 b=D/i5l4qZxrR6sakd2sfH19tUrDFSC2xRzUuJfG8mWAJ/YVnzIt9e3AsKgaxdf3jjhYAipvkjZJsFQUk7XX48n6xfHlh9SyMUoxgZvH78EdkE098vYcp0Ik/MLEfcHe4IIkUrO2heW2Iy64WUiamIjXiKLMQE6nuQyQyH6SS3hW8J8horsmLbFDSFtPBW2E/Q38Yp5GGw2uSDZEl2+R1aFqKdqaUNWXnq6x6V/P2kQFbuD77wwrSX38x0WHpP6yf/zTniTkEAw/amyi983H+B3nvPSALhetLc6lqWUUbTlz9IBQ9bd6/jbZNvYXtzdL5aHT/0DxTJao5Xn8SPGjQdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pDf2WQjm/Wvbblr1Z3aLWMdYDO8mSPeRWbRbJy8aAc=;
 b=ZQiQmLMHgeWg9wkEl+DuVJiQGqXJqPZmHgCF8XiccEJugtpIPUH+IJhv4fZHIy1RGpA26zCtEZdOc9dSGm1pKukj/XsQVtbIYoPoYdGxpdltmH6L22WbZoQtSajwZy7viKB9dL7xDgRT4fjnSbcUUlld/Xpk1McGBIuBzmj/SyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB7713.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 10:50:30 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 10:50:30 +0000
Message-ID: <f569c5e8-30b5-4f46-8952-02b9eecc1d97@cherry.de>
Date: Fri, 1 Aug 2025 12:50:26 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCH 3/3] ref-manual: gather all QA checks in
 qa-checks.rst
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250723-refactor-qa-checks-v1-0-3a72c751ba83@bootlin.com>
 <20250723-refactor-qa-checks-v1-3-3a72c751ba83@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250723-refactor-qa-checks-v1-3-3a72c751ba83@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0076.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::21) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 666f01ad-3e43-4faf-5e60-08ddd0e93b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OWJMdWIvd0ZQcHNMR1ZGNnFoWEtoNTZvQmxhNm1EanlVTWJuR29hL20xNWZy?=
 =?utf-8?B?MGRVSWVic1MrcDhsS3lBQnhpbUNqdThsV1dCZ2lBemxjSTBqRlRjOUg5VTVJ?=
 =?utf-8?B?dzhIZzAxbDExajVZTldDcWRHelVmaUZ4Ykl0T3kwb0EwZzkrbDFSbzFYaTdu?=
 =?utf-8?B?dm91MWRXVVZQNDNHNEpMamQzV05wZGNGUWFKa2JNb2daZTB3dzNxOE1LRWJQ?=
 =?utf-8?B?SGpoWnVVVWM3dWk0REFUalB2SzZyTkFNaWEzVVlKc1g0dHU1NlNVMGxPdW92?=
 =?utf-8?B?V3dJUG5ORlh3aWlMMHlEMVRGTVgwSG90VTB3N2FPQzMwVFhDdmJzcGtHUHRk?=
 =?utf-8?B?SHJ4NUJlNEtpTmVBUkNPVjhjMU5jZWMzV1g5ZlV1WHJvajZBaGlOcHVERHVR?=
 =?utf-8?B?RklJaFlhcFdiT3BrZGpxRmdiUjRaLzJ0RERQWmI3T041em50bDMxKzNzUDls?=
 =?utf-8?B?cEtXaWpyQW9zUlNtRHpJVHowVHdnYXYrVE84UlBIR3cyeUVOM2toSitmWEFt?=
 =?utf-8?B?MU03czFCaGZoWXdKODdCNnhaMEV1a0VqL2ZGcmxTcVZaZDUxV2pmWXc0OXhQ?=
 =?utf-8?B?VFRNbEFtTUNpNFhWOHF6dG5xbE5zYnpqTFAza0FiaWNaaWdGc3ZBaW1EMDg1?=
 =?utf-8?B?aVFaQ3Z2WFFNcUluNk1udmZlZzVES2Ixd0lEb0ZYQ1llS3k1NEF3UG5CWnk4?=
 =?utf-8?B?VXZqeWNxN1ZUQzE0cWhYVmJ6VXJKbkdWS0pJSWpQejBYTEJkN1loTWV1eDJj?=
 =?utf-8?B?WWYxTTAwWG1iUjZVVnRua0Z1S2JlYXRlaUg0aWU0UTZDYlhvZDZFTDVVMys4?=
 =?utf-8?B?bXYvV3ZNRXo2eEFyWVVuNlU4WHlYTEN3V3R6R3BwYkZCV3RGc1RJaGZpdUFS?=
 =?utf-8?B?SkxuMVE5cUpDazRsakxBaU82THZ1NGN2ZjVwY3N1cVZFWjRlK3lOK25EWVlW?=
 =?utf-8?B?UVFBTlQ5b09JQTBRQ3RwenAzR1hGL1NPZDE2a204UzNmbU9aczVSb3d4UWpx?=
 =?utf-8?B?RFlOUWxrdGVkYUJWQ2dkVzZtYXJXRDNTTFVjNFAvUTdjbmN3TURDa0VxVVlH?=
 =?utf-8?B?YlM0eDdiY1hzazU5QWdRem04dzFKSlE0NWZrcVhmRVYxUXMzckwrVXlSMjA4?=
 =?utf-8?B?aGphcmM1UVhsWlJNaTFubkVZVjlLYTd0VEttdXM4a1Q4OWx5b25acjBOSlRI?=
 =?utf-8?B?ZTNrOUpNSUxHaHFyYWlhMXJaZFZFLzlmcnNFMjdlMFpKaDBNK1N2eUxYZWhZ?=
 =?utf-8?B?UFBpeXB4UUFpNHNIUUhJeGNPZjFFVk9wQzlwRklGTmZzaU54NytUWkMvZ01G?=
 =?utf-8?B?Z042Z3BXRWRyalF2WFdJT1hQRm1JeG53UDhmYVI5emFTMFZMTm9JSjh2UFZO?=
 =?utf-8?B?Ti9YR1dvL3FVYmgra083VXZQTlNIdU9WUmlKbDZ4K01oMFZnaFVhMDlPZDFa?=
 =?utf-8?B?Vm1vMlByZWVkb3JwYVo0S1hDOWtJUGhicTk1WEpzMGpVOVRPMmNhM1hzaWNJ?=
 =?utf-8?B?ajErdVhiOGkycEQ2TDVVa3ZOVG5WaCtCbWE4bGNlc3BHN3VOZzNYL3Z1R3d2?=
 =?utf-8?B?U1VnZHdaTThYNDhSSkppa2E0THJXbi9mSmc1NmU3M1dBTkdZemV4dUxjV3c0?=
 =?utf-8?B?WmdQODUyaVFGYlNlaGhQNk1HTkRBNzRkWWVZd29PaTFvNlZSMDRrZWdZWXpB?=
 =?utf-8?B?OW8yb2RZdFh2VW41Y2xtN2tEUUVqbVYzN1VDYW00UHRvT01iTU9KOHRJU2N4?=
 =?utf-8?B?WG5FOEgzZExxT1MySUl0RXBJamVpcXJiVjI0d2tyTms3UHZoUlFRZnlhY2Jm?=
 =?utf-8?B?dGpFSFhLY0wyM0Y2Qkd1NEp0d05ZTWlBWmxPcUEyUGhqS0dNRUFGdm5yTERU?=
 =?utf-8?B?WG9xeFJ3Uk5KMFArY1RZSGUwdDZEQ3pMVGcrNzd5YmVHcnlTWVMzMG5UaUpk?=
 =?utf-8?Q?08M78FbfeJA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ODhyOE5vMmdlQUZEMnhzUXRaLzVDMjdLTGZMeWpad0dzMnFPM2w5TzFacDhP?=
 =?utf-8?B?bmJqWmlycEdvZ2l2Z0JJbGxqLzlocTQxVm5mc1BUaGh2bXgrMXM4eFZrZENQ?=
 =?utf-8?B?aTZTUFBVWmFqRi9OMzNmR2diUGVBOVVLbnMwQmR5TFpwWmR4ZEdzQUs1Umlm?=
 =?utf-8?B?Ni9rWE5xK2kveGNMTE5WeGNMV1Q5WW1EVk9iMk1qSEtZeVdpWWZCQmNMVVA2?=
 =?utf-8?B?N005S3Z1WWtrTXNuZFVaQlRTNThycWpQNVcvM2I4WHN4bnJEUmo0aVJkNUor?=
 =?utf-8?B?OVdBTmdPMlFMT0k3UHV4a0hYU2IrTms3cnJNOGxXMWRyV1MyK2p3dCt4QlFi?=
 =?utf-8?B?TWFpcjZ4QW5WcEFhc2xYaFVXS0NSMytaV0dWNnJJY2tEK0JSTE9YcXV1ZXBZ?=
 =?utf-8?B?L0gxeEV0RW9TS0RrK3hFamxtdlJwZVBnNlcyWjMybmZaNXlqdjZYaEU1VGl3?=
 =?utf-8?B?R0RIZzNOTkZDajhJR2p3djhPRldxaFpLZ2hNcnlXYk1WMHgzZ2JrL016M0xj?=
 =?utf-8?B?WFF5Zm9oc29pVlU5S3ZiTnUyZnZ2UHB1enNFOWZnNW03VkJkbThpMUJnNlpN?=
 =?utf-8?B?YkZ4TmRXRHNRb29JMzJzNityNE5XdTFiSnJuck1vNUp2Tzl1cUovd0pEdFc0?=
 =?utf-8?B?aUN5TW11UUpyWk0wckNPazRYazNSUjAwSzhMRVhIZlNTc0tmYklPbzJRTXVW?=
 =?utf-8?B?WlZhcTVJanFzaklPTHh6eVhyMEtpVXlVQnhpN0RwenBZZEN6ZjJjTjhNVkVS?=
 =?utf-8?B?MGxUWXpKTnZiY21MYnNXeHlKTmh5QzhBT3VjRkdMWVIxc0JjcjlrYXVWb2lo?=
 =?utf-8?B?bE1sTmNhVERmUUZxeHM3c0lBQ2dhdzVNTklFMDU4c1JRWGVjcHVpdTFTNVli?=
 =?utf-8?B?TEJtbWJBMWh5R25WRm8zRFF5Q2kyVDNycEZDTUQ5cHFLNmcyY0RYd3BoRHNo?=
 =?utf-8?B?WGh5SFVxQWEzQ0hReVIxMTVWWHM1cDM2ZkxWczdERDZpSGllK2RIc3p6QzN2?=
 =?utf-8?B?bjcwT0djTVBHeERJL2I1NmIrVkFrMitlKzFqd1NjK0NKNzBUR2w5VnR2eWpi?=
 =?utf-8?B?SzdVNjlaaFkxbzRHbXdCZXgzYlg1aGxyWVUrbGh2YUhOeVA3UnV4c2NvSjBa?=
 =?utf-8?B?TkxJQmp4dGxvQzlzNU9IN2dDOWpDUU1rL0pCa3VDdmIrRGRqZXV1Wk5FUXNL?=
 =?utf-8?B?NU40ZWJVUHRyRjZYaHdkbUowYUcvUk5WdEN1ekE5MEZwWEU1aW9GWUtNY0pW?=
 =?utf-8?B?VWpIdk1NVm5sV1hRUDFidnlHR2RkRVRkcFZtWmdVRjdLamw2MUNKQ3E4ei8v?=
 =?utf-8?B?bzR5SU1mQ2IwYktnTlpmOHpTeitQcWM4UE1VcnNSTk5FaktobWlYL0czWlAz?=
 =?utf-8?B?NllJUmlNUStJS1JkbFFxQ3BPUU0wcW5FUkxpR0JNVDQ4ZHJPWUt2MUJKOVlp?=
 =?utf-8?B?WFJHdDFiU1hBcUZLYjN6cDV6cVJaQUQ4czkvOFhiRmlrQ29sMC9rZy9HQXNp?=
 =?utf-8?B?OE5LbllpeXZhRUdYeXkxMFZEd1NQS3dYanV6Mmhra3R2YjdKZlRKWDJoRDRx?=
 =?utf-8?B?eXFvQ0NrVmZkNWNYak5ncldVMTVHMDF6NFJQajhuVDZRS2hsK3FyVXJMcDgv?=
 =?utf-8?B?RDFLQzlBdjA3REhYUGE1UUdSOGQ3UGVVS3g5dG1BcTRuUGVicWZlTE4yZDdT?=
 =?utf-8?B?UkRlMmdUYTJ1ZHdJdm9DMSttQk5sbHA3UGo2QXllcDBURi9OcWxLb3VHNTNO?=
 =?utf-8?B?TFNyd1VyNXRPOU9CWHFVcnRXRTkwZnVNY2lMTW9ldWhkSDdYS3ozRTllSG1Q?=
 =?utf-8?B?MDVUK0Jna09OMHdHeW1uR0srMFQvblVLaGt2bWdSc010NTYzV3dHUy9NNlM1?=
 =?utf-8?B?QjU2czFlWitzaWdWSmlTSkIwMUI5U2RaNUZPcWdjalJvOG9CejhMc2tRWWhN?=
 =?utf-8?B?ZjA5V1BTaldwWXNPVFJoVUNIWkZBMit4cGlTWCtrdWEra0o5Tjdsa05PWDZO?=
 =?utf-8?B?OUpnOGZpNTRtY0N3cy9TcHkzb1ppL2F4a1NpK0hXNWZnejdKL3l4Q0xLcy9i?=
 =?utf-8?B?UmFscm5ydmVPeVJuZG9CYXRDS2VEek9QRzdLYVorekw5ajEyUHgvK1UrRHBv?=
 =?utf-8?B?cUhreVlFYVFCQkxyOUxiWFZ4WEZxb1AzOE42eEhGSlJIeW1RZkFHaXJpdi9q?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 666f01ad-3e43-4faf-5e60-08ddd0e93b71
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 10:50:30.1116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5N2USWTf7+UErfzHF5M9/NLVYRWPpuFd+oyRIH/hb9+1hOlAKkxW5hsn9gin1J73hEYdWCT8OWwoueVvU6PKIbO09QmJqw7jUygWWi9800=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7713
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Aug 2025 10:50:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7428

Hi Antonin,

On 7/23/25 4:27 PM, Antonin Godard via lists.yoctoproject.org wrote:
> There was duplication between qa-checks.rst and the doc for the insane
> class, so move all of the QA checks in this qa-checks.rst. Remove the
> documentation for these checks from classes.rst and link to the
> qa-checks.rst document from there.
> 
> For QA checks that were only documented only in classes.rst, add them to
> qa-checks.rst.
> 
> Also sort qa-checks by their names in qa-checks.rst.
> 

This makes it difficult to review, it'd be nicer to do this step by 
step, e.g.:

- sort qa-checks.rst
- moving duplicates from the insane bbclass documentation to the 
qa-checks.rst and link to qa-checks.rst instead in the bbclass documentation

maybe that'll help make the diff a bit easier to navigate?

I've limited access to network today, and I tried to apply your mails 
exported as eml from Thunderbird with git am but this one fails to apply 
on top of master (f9f1c87424d307d2df60024bc448bd6778605cf8) maybe my 
local master is outdated? Does  it apply cleanly for you?

Cheers,
Quentin

