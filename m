Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1A9C02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 10:14:37 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.1])
 by mx.groups.io with SMTP id smtpd.web10.7732.1737108868515996733
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 02:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kcSIiLXO;
 spf=pass (domain: cherry.de, ip: 52.101.66.1, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvUwygmu6xc1xendZl5YFMjhObsL2BODpTVP7ah3oLo9CBxkcTBD5a3oXPIhD9j7X6i1sRZv1gt4K7SqyBk3T5vKAnKsrM4QSKRLw3fJwiVoJPj6xpz3HWfEakAHD0JfKE1SG446bA77byLQ2nh620DqIcDtIZNaNr2wRBj7RUlpyyeAuqkVlHIsPCj+xPlT4mx7D8YUrNn1qahD9a2HAEc0tOJ2KGYdQuk5JT32Kqi+NKAHp2HcBO8U2pQD0E38jxb5oX5sAgJROBFprcD0ndGVXdu+VNWuyjTBv4W+U/cGkty2fn7URaqkXAsuf3q0Y6mK12Wn1Rw/2vq8OXEyPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnRhlp/33EggpxBgjn5ItP7JhlWLI2vtn1q75Ymadzw=;
 b=ZxjEfGHPLQkxPyBen287JWFlbHukgPqgxYveGmJB2GoPNNeAlGRkPEINrtNQKHy6G8MadNCjViF4N/xl5Lzt6oPY6/qmBBj4dCC5/Wg2najqZ9aPeNcSYaalOugzUAwoslS3SMcOu5VzcV4G48b8pQi0sHiH4mDB55K9i5sK3pfu7k5/zarVGf8jRcdPk+yZApJGTpJjg0WH3KqIBawyn86jgp5bIU9HHY7OWBSUD6aRZIPN0ufpDYc2tyv9D3Zel1XI1DHbbvIKdEuEEYr9KnNXNNX/48t7w5ygUmc3Fk1AsSqKV+hjrD62IvyTeyr1c+DLlyIrUENq3xay5XC7mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnRhlp/33EggpxBgjn5ItP7JhlWLI2vtn1q75Ymadzw=;
 b=kcSIiLXOD9U5LGjVrl/zSmmjnp5DFlJEz8EVilXZauyiX325uJoh9k1aX21juELd/yjs299nJ0Bx7h2figE6gw8Eg1hWpg/a8oXxImH2jYhyQSnp9Hk2JhGdIeMaQp8V0P80NN6vWP5vooJJFxPGYG3qfTPVFuuBSlI2LbL+Z8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB9208.eurprd04.prod.outlook.com (2603:10a6:20b:44f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 10:14:26 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Fri, 17 Jan 2025
 10:14:26 +0000
Message-ID: <81494399-aaf9-466f-a390-8018622a2ebc@cherry.de>
Date: Fri, 17 Jan 2025 11:14:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][PATCH v2 2/2]
 test-manual/reproducible-builds: fix reproducible links
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250117-update-autobuilder-link-v2-0-3ca2d22ab24a@bootlin.com>
 <20250117-update-autobuilder-link-v2-2-3ca2d22ab24a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250117-update-autobuilder-link-v2-2-3ca2d22ab24a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a66771-6a8b-44b7-a6a1-08dd36dfb8fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MEFKVi9CalVWekVvMU84Ky9mQTZTZmpzSjAxQ2o1RzJDOFZSNlY3RzZkVkZS?=
 =?utf-8?B?dXNLNlFwcUtabkhPd3NhaUJNbXlHQ1pFTlNlcGlvdFNiZEFWU1JjZHViVEMz?=
 =?utf-8?B?ODMyQi8vWnROUXJKQnFlNk5Yd2VaN1BTUlhhRVlTdEpQd0NxS2NnQTl6amI5?=
 =?utf-8?B?c21CVGV4c0FDbmU3UlhYTUtxUDhEaUxrTFhqb0oyRHRwVkU1NE1lcGZMUjVE?=
 =?utf-8?B?RHVmcU1nTHYvMWdiV3NxOC8rcVowUXN3MFBBRG83c3ZtelJYeXVTc0UzUzVv?=
 =?utf-8?B?emZoV3JFTjZnL2R6a3VRTlFsVGhoam5OK2ZidEkxM0JRcUtLbm9wL3ZBcEJi?=
 =?utf-8?B?bjNBV0lCdmw1ZnU5dEw5M1BwUmNMYzZyWnlwTU0xR2o1ZjJETStONjlZaUdi?=
 =?utf-8?B?Q1hUYy9pR0MrNE5sN0xVZ016dU00YW1lQ0dOOW12K1AvWk1KNXNaenRVNzJY?=
 =?utf-8?B?YTdKbWFmWmFEK3JKcEo4UjgxbHRZb3VhNUp2RVpodlhWdCt5QlpiSVNBVEF2?=
 =?utf-8?B?ZHVVYS9KVTdmUUNtNktyL1lqeTJ1aHArMWl6NE13bURNTy9EcFhoWGJPaTVR?=
 =?utf-8?B?L0dyN2NQdWI2d1JKOStOT1FodXpiUkJkd1czS3dBTlN1eEpjRUtvSUMvWWVN?=
 =?utf-8?B?djRHRWdRcTZBYVJVNGRSVSt0alZhM0FsVWhOUGI3eVlxTUZCRjA0ZTlGME45?=
 =?utf-8?B?Ym9ybXlsa1pPUEVJcjFzcXp6WG9UL3BwS0dvVTgydkhPSWErN3NxTnRlRWx0?=
 =?utf-8?B?RElHVTVUOXkzZFhxSHpNUVFjVTN1Z3pBdXVNSGE3cEt5VlRkUCs1Myt3STQr?=
 =?utf-8?B?L0k0dy9NMmJnK3cweXM2OWhuTXZ2S2R3NDVQejBZajZ4S3N1ZjdxVU14N1kv?=
 =?utf-8?B?ZnJSYkt4bThDNUhWbkxzK0dmU3Y3emRWRFpLb25QSzRkMjJCTmxOb1QzeEpN?=
 =?utf-8?B?Qmh6ZGY5OWQ3MlBQb2V4NVY5a1c2STA1MDNLVEpMQy9tdlBucWIzTjM2NmRR?=
 =?utf-8?B?TFhZZFc3bmczbldWU0RhUnREYmlqTGQzQVZjVWgzc2FJMnVzalVBUUNaM2hO?=
 =?utf-8?B?SnlmczdURzgvTnJCWFNSV29aY0VyanFqcjJoWDhuTW0rOWdBT2NXRDBHTjFp?=
 =?utf-8?B?YmsyaUJ2VkZyNis1eHo4YU0wamUyb05MSllKbHlabUR1OEJudXlYczZUSnhU?=
 =?utf-8?B?RWQvcDFvdEVjci92cG1tZ29qdVJKWEtiVFRHcDB6cURVRDh4WWordzZqSlM5?=
 =?utf-8?B?c0xqOTFNYkwrdEJDNno0czMzeWIzbG9jcUR2OFZzaS9ZMlM5RUxoSVBUM1Bx?=
 =?utf-8?B?STZKY0xJbVYvMi9HeTg2ZkVRaE1tN1YxeWEwWnlwVWdiMFBwVmVMYmdONExM?=
 =?utf-8?B?ZlZtelA3eUZNUmw2ZHBXdDJocG5aVkZWQ1YrdFdUZ2R3V3YwUzNvUU9WNXdW?=
 =?utf-8?B?K0c2UkNlQmJ6bHdaQUpoSE5XS2NGWVRKcE5RTFBDZE1rUm5FdjZGL1V5Y2hC?=
 =?utf-8?B?ejlBR1BlRFliRk90eVIrakp3dTlSL1RyVkR4d1kvalFYME9FdFU3WExtaklx?=
 =?utf-8?B?YU9OQlZPeUI3NFhvTUp3aHhhUVJEU0d6M2oxME1oNkhuUWlOTld0U0pUYm5X?=
 =?utf-8?B?MHl1cWlPUTZtbmFWTDVwWnBvUzdGUU85VFVNNExsakJjVUFWTjEyb3F5RjVq?=
 =?utf-8?B?akNoaEV5ZFFnaWFPTXUzNnlyWDRzU1VHYjVqaXNHdVB3ZXhYbW12Qy85eTJX?=
 =?utf-8?B?V0FKdHQ4M0JMVVo4a2l6Z3dNdDMwQkJlNnd0OXJIK2dvc1krZ0Q5WHBGanhK?=
 =?utf-8?B?SUd3OWF1Ym5wdnYzRzRJTlVrL2ZyVjBKZHUvWXJybW9nNWNTWTBwSWpCWExk?=
 =?utf-8?Q?VKv8s2aMvopdG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NCs5YWRQd2tWQlJuUlM3YnR0aytLdFMzRmdmR3JPNjQycTQ4VWkrNm5NWVFw?=
 =?utf-8?B?UDg3ZXZTSXE0bys1b3pzVGdnclVXclVxNmFhaVBYTXRsN2Z5OHR5N2duLzFW?=
 =?utf-8?B?TC9BcjFCTlg2RXZaUGMrS0NOQmdWekxUaitNSGt1OEg2VGZEWElTek84ZExF?=
 =?utf-8?B?YlFFRWh1Q3kzMjNzYzc2K3B5bHJVY1VGQ0c1cXVic2x3Z1ZUTUFQSXBBRjRo?=
 =?utf-8?B?Rktwb2Nzd29EbkwvT0VVNTFuazJmYkFCbHNjUXRFTGJ2ay95WXp6bmJVaGow?=
 =?utf-8?B?d25udjNQaU1OR21XVWVnUkdQSitwZVdPVncxbytLQmZxdmlZOGR5NUswckhQ?=
 =?utf-8?B?ZkFzMkJiS3lDY1ZGZ01BeFFlTHBBUjNuaXR1UGE3K1FUdVlCSXE3VWxFcWNy?=
 =?utf-8?B?d2VxRk9kQlloc3Vmd0txWnY3Q3ZtaTIxU3RYTUtCc0xROFlwRENVb0dKQ1hQ?=
 =?utf-8?B?QVhOU0FMVHJhRUo5K1NycjlWdUhGK21vc3o1b2ExL0Q3VVJiYnVraTJZNHAy?=
 =?utf-8?B?dHFKMDFsSGUrU0ZMMjdKWTVOMStVTDU5NEVsMGlOK0ZYSHJKVk52U1ZjSTlm?=
 =?utf-8?B?RnpHRno4Slg4bXJ3UGVKR2Q5S0FHTElWQ01XWnNVNi8xUVlXOHhVRFZIZExU?=
 =?utf-8?B?N0hSb2wrMXRqRVZjZ09ia1lvU3FlWjdTdGFTSERSeWhFaHZIYWRnK0Z2eFZn?=
 =?utf-8?B?dnN2bWU5SUEycnk5bGZMdmZJcHRFd1JLNkd2b2x3VVY0QWhSZWhOTXVxeEZ6?=
 =?utf-8?B?S3NkYUE5czltVmFNcnZRR2xQWk4wcnczanV1OFhETXJBZHZGSEpzODNCOGJa?=
 =?utf-8?B?RE5SSTBudzNhU1k0T3d2cFNoMFRpZUsyWlN5S1crVDhoTmVFL3M5Rm84c2Mx?=
 =?utf-8?B?UmlxZ3BGZEs0MDJTOXZGWmprYWJVZ29tM3dVTjI3QUpVaXBLQ1d5ZjFwVWVi?=
 =?utf-8?B?ajNlL3J5NTRreVA0NzJiQmxXSVRZcm41c0ZGUEpCTkJWd0NFeWpMKzFUc01R?=
 =?utf-8?B?Z3crc3ZlSGkzS0NhemVhTmhYZVVQbmViaE1LZ2lQMlhXc3RpM0UrMTZ1L1BZ?=
 =?utf-8?B?b1QzQmY1elAvUHI5TG1mUEJLQlJlTG1UYzh2dUhyTkJKVUgyUGY5NDIxajNs?=
 =?utf-8?B?V1lCZ05KU05nZU9yWkdMZEhzbk5qMjhXcXBZOHA0VXAwYTYxb3NjMGJOSGxt?=
 =?utf-8?B?ZnY2TkFxaDFkOU0zbmNNY0FpTEFHQjJscjFzTGNzK2J0bndBcWIrajZKUlIy?=
 =?utf-8?B?T0VIakhpTGdmQ0xhQ0YzR200UGJ4bzc3U1lZOWtFMmR6Mk1Ic28wb3kyVzhx?=
 =?utf-8?B?a1QxODZQZHdvQjJYNzU3U0p4L2d3K1ZENXdnUFQrMnl5VTNRN0JRTWwva3Ew?=
 =?utf-8?B?eGVSREl6MUphZ0ltbXBYYUxhSFFTaFFTVzRLV1ZlWnJVREQrTWFyNkZGWkox?=
 =?utf-8?B?dVVKVGRlT3poVWJ4QnNNNXlnSXlUS1RwVWxhdytGb05rZ3lzVStBSURJcC9a?=
 =?utf-8?B?UHR0d2NLa0cxaExLRjhlb3ZBamlDaFJrM3ozdDlPWE9IWXdYeGdwVFVXU2JQ?=
 =?utf-8?B?Y1FxQWxFRnFHaWJaNkc4ZTI2a1k3ZGR0OG5lcFZxaUljM3N0UTBocDNQRFpB?=
 =?utf-8?B?WG9rOWJ1MERhUzRrZkZnTlZkNkRpdXlkekV4QVVVVGRoUkNxNlU5RlR5cUJz?=
 =?utf-8?B?dlpwVS80VjJ3dndmdWVKNmRjdFdROUNQSzlFcUtuS0lGUTJkSDRadFovTXBh?=
 =?utf-8?B?L0drMmV5NmdhK0RtcU5sSUFNSlBVZkFLZjM0elFld1dxSGhETWtkd1Rxdjll?=
 =?utf-8?B?Y0ROYnNJUk9oZDdvWE9ydXpKdkJSTkZVTXpVMFhyS0hFakhHL3FIc2xNdWFD?=
 =?utf-8?B?c1ZTN1RVODNENTg4V1N0R01uRDBJT3ZFclhIZ3crOTJGWEx3OHh6L3NVNU9Z?=
 =?utf-8?B?VitaM2poV0t0Sy9UWmNmTy81M3Y4RnRIbWJIbEtkcDgwL0l5a2tQM29yTmZU?=
 =?utf-8?B?SFRpNis4RzV0UGZKa3N5R3YyekgrdzcwTW5hQU9IR2ZnL00rMW9mTnlEc2hv?=
 =?utf-8?B?YlFRdndrbEJ4a1ZRU3pQcG1JRm4vVnNUVE4vNXdwQ2xtTnRiRTQzc3BNK1BS?=
 =?utf-8?B?K1YvNTlhUnR6SGVBNDg3ZE9WWmNPRmNhVk9LaUpnK1RHYTIrcno3TGRzZkNv?=
 =?utf-8?B?TXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a66771-6a8b-44b7-a6a1-08dd36dfb8fe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 10:14:26.6876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNjBKrWIYoWX1pgSEKgDXqQ3Z3ru485xCIXX5DUwRuX6MOx4oFmKlxcjhmq6hCq6ktOqV4MUCLxYRBapLwafRWQLkvWTLX1egUkrZ+DfJhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9208
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 10:14:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6126

Hi Antonin,

On 1/17/25 11:08 AM, Antonin Godard via lists.yoctoproject.org wrote:
> We don't run reproducible-builds on specific distros anymore, but on a
> distro at random depending on what is available on the Autobuilder. Fix
> the link to this builder and remove distro specific ones.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

