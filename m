Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9C2C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 16:03:13 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.87])
 by mx.groups.io with SMTP id smtpd.web11.53433.1740067388460006276
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 08:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=MvlLVMC3;
 spf=pass (domain: cherry.de, ip: 40.107.247.87, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ka9tXxnqBQpRffgtPs+O8Iw9ATTuogyR9CYebnHvzrTR5Vf7aMDunwQEWYijgkpgpkBiQS4ODoz0ZcJt6HEZw5vQIJpMZF3liyGCk9dnMnN/VZJ5yJ2tUP+xdyxyvA2tnDMOkUg+2Sy2VFezzT9rHdC7vavX9VJsAbMBhIpXfPmlgSHSOCoHof362PRW+Wa9mwuBQdB9rheb25d8ZjHelMi+SVKfLvW5n1K78t0hr+EnDbZWznTr0FxPLbzcV9Fa62jwCpWEVD1EY5lJQ1a1lw15jLo5vhMDzU2Bi6FIe5LZGcbGq+0O9loSm/0cISzBWfP+1lWPR1SvKGG08awQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+XdmAooBiXDnaUlELlLH12GSQll/W68QPdeve6eGq0=;
 b=ScDn0QSUjXBCSAvmRDj29+SzCR3i+B0zeiIKbjvO0t5doqoC2EeX2mPAuJ1gj/hqt4PXtd5yYanPsXqSYT3wmxVft7oDF8RWpEPKhrPnGlbBEzp8deC7ISFZYoBi+a4+JhSKbsXfTc0h6UdugRyKWhYvhCRMjrzF2D9bQ1ub5A3AEaen0bJ2FrIhqOkwiVoQTcfzYjpYdBKtKwQ8QA0H/CcfheBZJHSPEoaxEMmKLQWhmFXLCXTmXlP7EJ3J1c4KXu2KUOei8jxRS39FP0QDczvwbpwYT/bx5EIpoW6odY3AohDw/QIL8vcpWcSnvLwLLVOUEfK3xfrSpUXF+j8siA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+XdmAooBiXDnaUlELlLH12GSQll/W68QPdeve6eGq0=;
 b=MvlLVMC3mH6Mf4AiKXhPZ5mL3dNYgOQFWiTtwSeBJfJ8l/CsH2AUs/kcg/y6Kl2GoqWGLVG4OdSuejEk9YJkWkSIHYegEGGVxne0c6sQKQ8jCCxBelP4qEofi+EMFmsCoSSGoUiu6LETtcHR8qPs6nGHAK4cvJEyCo13UgW/fa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB7047.eurprd04.prod.outlook.com (2603:10a6:20b:11b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 16:03:05 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Thu, 20 Feb 2025
 16:03:05 +0000
Message-ID: <b43d711e-1d1d-4737-a174-c93f94ee1028@cherry.de>
Date: Thu, 20 Feb 2025 17:03:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/6] overview-manual: convert source-fetching.png
 to svg and fix UNPACKDIR
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
 <20250218-overview-figures-v1-1-75d23b5e7a88@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250218-overview-figures-v1-1-75d23b5e7a88@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c7002dd-ebad-4d60-9a96-08dd51c80f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dTloRmZOOFczWkRVanVBdzlTR3hmS0tVQkNqZ3oweGhPQXlER1YrdnYzOEhj?=
 =?utf-8?B?Lyt2MkZ2dzllVWRaWmh6WTVGOHp5SUdDSXREcUc1WnlsQXY3eGk0SFhWeHBY?=
 =?utf-8?B?OVA3Rjgrei9xdjB0SnRZQVA3ZW5sa2tmUzZpeWlFOGM2N01LWWxVU1MxLzlv?=
 =?utf-8?B?L2dhK3lJK0wwZThMcTdXN1BNMitwZEVNTGZ5NEVlRHZ2VjVhSmlSenM1eStK?=
 =?utf-8?B?RjlIbFZza2F6TWExS01Sb0dqMjBzQ0JxWjVITFVZUXB0c1VTNXlNWmhJejBE?=
 =?utf-8?B?SjRnMTFtV3VmNUJtRlZnOE13WXluYUt6SGhRMmlCWTRaQ0w2bFFJRVNBQnlz?=
 =?utf-8?B?QS9NcFl1aitSUGsrcEtIQm44THFTVStQQldhRVArbWRXU2NuVGdQZlNLZmVS?=
 =?utf-8?B?eFl4QVEycklUaWNGUytVMGZuMjNvTW1iVmoyeEpROWx1VXF4VHY1b0hmbDNJ?=
 =?utf-8?B?QWpuNG5BTnZRcTNiS1JONnd4RGhRdXNwVC84OGc2SVNTcmIxSklDZVlkaXBK?=
 =?utf-8?B?K0FLdE1LZWFDRGJDek9SSjRjRExTdXdJWW9XOHYwZUtLMVNrRExXY1hkS012?=
 =?utf-8?B?TUZwTjJIdllzNEJvOGpaSXlodmVLc0I4NlZlWEpzVXZYSGFlNms3YkQrTUx6?=
 =?utf-8?B?SEdIdWRvcjE5S3JrRzFWTXBXZVJZSXpVdUZRWk9vM0o1bWJ2MnplU3duOEpv?=
 =?utf-8?B?b20vZ2VLN0htS21INGJFeVA4YUcvU05jTHgyOE8zcXdlSEtLSHlBampmZnh0?=
 =?utf-8?B?UWJZZG80NXRrUEUwSDY0cUtWdVZGaTZzc1BJNlJJS2UwemFhZHpVOU9QVHBs?=
 =?utf-8?B?bHJ1TUJOQ1RnUEJIN2NjRSttNWVRby9rdFg5WGtoOXRoaXB1a0VwQWowOXY4?=
 =?utf-8?B?Vlh4cG5oUnQ4bWxGS2pNUU1IUG43cFNBenNzd2hZYUN2ZFdCT1diMkx3R3Rz?=
 =?utf-8?B?UkFkZ1JPTGUxRWhzZ0pPejFNN2czY2g1enNKajRBdHpWcnVRbzVHVE56YXZq?=
 =?utf-8?B?NTgzVXRvbVdVRnRZc0w1VHRPbGR6Nk11YW5mNDJRNmFzZnRNUFcybXZSNDRj?=
 =?utf-8?B?bHpLNmVtTlp2SVQyNlpiNDhWOWJHcDk2YzE4RDEyL3hFZ29JaEd2eFhLUi9O?=
 =?utf-8?B?alpsRTR3dVRqS3E4U1Q5OXZpZE1QeVVyWm1UbVNyNXVDRG1UdWo0Yk9rZEtC?=
 =?utf-8?B?emI1RHZadXlyclFveE9GaWpqc01EY21BaGpFT0QyMkRkWVV0Y3prOGgrZlgz?=
 =?utf-8?B?S2hKNUtaVU5pbDFwR1RkWk5mdDJmUzg1bm1wZmM1b1RaWkszUjVWd1Fma3dp?=
 =?utf-8?B?dFduczZDcTRGK2krS1RCUDVPR3Jvc3EzSGZHVHNkaTI3Mm9NK2lxeHRJL0Er?=
 =?utf-8?B?YktDbG1MNUxFMVJFVnlablA2aFhXdFFhUnYzNzdCZEZTNFIvNngreDYrRFls?=
 =?utf-8?B?L1k3UU10Q2hRRmNjVnJQSGtPMzJjVm12eGw2eFpJK3o4YXZqRytuTXI3cDRy?=
 =?utf-8?B?ZFQ5Qnplb1creG9KRHBhWTNrWkppckFYWFJVR1hwbE1TTU51SmQwOEUzbStk?=
 =?utf-8?B?M1k5V3NOQXBRZ2dVNkkyK3lzNzZmVEdFTXhkcHYrQjZQOWFablR5QTZXdzFv?=
 =?utf-8?B?NElHd3JvcW1MdWtxbmdNb3hBUjFFSmR2Y21nUDJUNUgySFg2NGxqdStEc2tZ?=
 =?utf-8?B?MU5FaUxBREFVeXAvM2l2dVZXMWM4MVQra0VCeHJqeFN5cGd4NVVPZFQ3ZVFv?=
 =?utf-8?B?TlJ5eEZ0ZkR2UjdISDJBR0xjWDhGRGN5enF0bDU3SFF1azZiM1c1cExTSGRz?=
 =?utf-8?B?ZkVwWG40cHMyY2xheDVOU1ViNlo0cWZmRFUwd29weGh2ZlRkTGdPZHF5QVVa?=
 =?utf-8?Q?wxZT6BQw5IUSK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a0dZRUt1WENmbnVOOFBadHByNnNvdmttOHNKQlRvSExtN0ZHK1N6WFVIbjlm?=
 =?utf-8?B?RmRmYnR2K1h5eFRDK3VZQ3l4bnNVTVh2cUhIYnFmS2g4YkJTWVZhdkh1elFF?=
 =?utf-8?B?bGdwNGRSZnhock9jRVRtREtzRklNbkw5UWVYKzQ1RFQ0WTJ2RGdGd1RBL0Jh?=
 =?utf-8?B?K0lsaFlyRmhLTGo1SXJtTFI4Y1dhMXVXazJNSTVmUmh6WFVpbk9RR1pLdVU0?=
 =?utf-8?B?VnlBbWk1VkdPUVczVWhoWE0zV2ZFYnpQU2Y2ZWNrc1VpREpMelpEVmFlbUtZ?=
 =?utf-8?B?VHdkcXpjemdiUmx0d25KeFRUcFV0OTVDdUNQdzZkblN2NXhYbmVRQlZyY2tG?=
 =?utf-8?B?VDBBRFR1WkcvVmhCZ3Z0SE9lRkJSMmg0b2NxRXNWMnJUSm9lUjB6QzZJMHdw?=
 =?utf-8?B?SUIrR1hWOTM2YjNET0ZKRXVZbllTcStRZ01WWmJOa293Wnh2aGZvM016K2s4?=
 =?utf-8?B?ZElLc0IxcmNnejE3QzJBYSsyQXU4ZVZBL2xZU1ZBNUt4SjJHc2pCT0hqNlk5?=
 =?utf-8?B?WGYvVVhrTWlZWmJyOVMrZTE1L1BrRHJ2OENqNmtLWnRReHlpQ0JSS3o2ejNZ?=
 =?utf-8?B?ME9LLysrczRmRFd4RyswM2NhcCtnK1FNcFRDUDdWSGVSWnhCK3NseDVQUTJw?=
 =?utf-8?B?ZTFDMDkvRStNSmxWb3FYaHVTbTBUZ0VHMDdsZlpGOE9vdlVXdHc0QmNkMzdM?=
 =?utf-8?B?R3R2czBCV1djNlVubFpxOTBxdFgramlwWWcwUlJuVmYzWG52NnhHSkNRL3Zo?=
 =?utf-8?B?dW9EZnRlMlFRWFY2Z0M5N2tkanozZTROTGpIQjIzeTVwY3duOTN5U2F4ZnNV?=
 =?utf-8?B?MzNSWTErY1J2S0NwUzg0N3RSUzAxVG8rT2laM3A2UmhMSXdRbmM3Q3V5ejl3?=
 =?utf-8?B?RXBPaXZCRjZtZW5XeDFjNEcySXJkdU42dzJzaW8ydnVIRFVvNkdQTHZhMHNx?=
 =?utf-8?B?K2F4aUx5azhxY21jbndpei9rVm9JK3VURFRoUFpGVTM0YzhNUlQ4VWZsaUM0?=
 =?utf-8?B?VFJxTHA5bkp2Q290MEdTWXhTVnBFSnh3UmRBN2xmVms2WVdodWlLMTg1aUxE?=
 =?utf-8?B?YVhLRmFrcHFiVTdXdi8xUmNsNmRrR3RqTWhpaVpDU3Eyb0kvcnNHQUE1TFdE?=
 =?utf-8?B?dERNa2dBMEg0RU5JZlRYTW1hSUlYREZUek94ck82RnkrMU9CU3VpK0tzZWtw?=
 =?utf-8?B?bm1lZW5yZi9LV3VaZmNYdzFXU2p5TWdQQVpvaktJSm9JbERESFlVcUFJK01l?=
 =?utf-8?B?Vm0zVUIzWGNVLzNVVVkrbFhNU2pKa29OK2xhaDJHNFZ5emJVVXJscnF3VVJx?=
 =?utf-8?B?WUpxWkphMjJvZTROT0dQV3ovOS9aRWFUVDZ1bjNaZmc5N29OTk1sbVdUSkhP?=
 =?utf-8?B?MGc2RUxRM0pKVzRrL1JqRTFyTWc2bWpVUHRFenhYNVFIckhObTZXQlh0YTRZ?=
 =?utf-8?B?YVpKcmpoNFVQekNmTklsbFoxYklTTkdxK2hKV0RlLzZMOENBODFEeUtGOHVN?=
 =?utf-8?B?STNtUGxBbGp1YW4reGx5OFc2emdGQlZZNmRVWkFZeGtpSFhZeG5JUytvOUNT?=
 =?utf-8?B?U3FBclJGMm9XbE1uTmtPSFhmT1lPeFpCby91NnNqenNXY0NaQkRWZ2ZXNEsv?=
 =?utf-8?B?Q3J3eFFtcm96L1o2NnZqM25zSUNuZk5IaHBtTE4rSE5mNWJ1WEFjREl2b3pv?=
 =?utf-8?B?SlZmUjBiQ2FUUGZubjhIK0dsME5RYWI1M2dNNitzcUF5Skx6TlJoSXlIMUlG?=
 =?utf-8?B?andnUHFYalZWK1FMajV4dEd3MWIzeHQrWmI3OGxuWGZOUHR6QXZVbUhVbmhT?=
 =?utf-8?B?ek9Pa29MQXFWWEtWd1Jhd2RJdnNjTDFWbDkxMEk3WUIvRDZGN2N5MHNXTEV1?=
 =?utf-8?B?bGt1YzE5aktaWE56aWMzOFBuSlRPOTdLYjh1OVVuVlRmdGE3TGdSSlJYcGZp?=
 =?utf-8?B?SjRneUVWMlhYUmNHVkhjY2Nod01pSXNWcDdSY05hUmZXV0c5TVJCRVB0clQz?=
 =?utf-8?B?TFh2ZGxJdUxybE5IamlwS3B4MDVrQnV1KzJhSzk1QzduRURIWU5takU0NHNQ?=
 =?utf-8?B?VngvOTBHZGJLNzNoWUJ5MEVpWmthSUdJNXp3L3libzJzYjRGbmoyaWlCVlhB?=
 =?utf-8?B?VytVSmwrMkFEV3B0Zyt3bFgwREtpckc2c2pwS0xwWEg5Ui9SaTlFRHhPK0ZE?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7002dd-ebad-4d60-9a96-08dd51c80f9e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 16:03:05.5381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQyc3b6ujmLoI8OqMoAbUK5Tj8xDM8O+6VbYu9pUW8YBsG488ELseRrj487rtim/IdDQDsx0g8oIAeyokmgneSBX5x7eQRN5H1DG+m52QTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7047
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Feb 2025 16:03:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6419

Hi Antonin,

On 2/18/25 10:11 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Convert the png file to an SVG file. This will be easier to maintain and
> also weighs a little less in the repository. Also, add the new UNPACKDIR

Well, it'll still be in the git objects so except if you download a 
tarball or limit the depth of the fetch, we won't gain anything in terms 
of size :)

In any case, PNG bad, SVG good!

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

