Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0649FD49234
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 15:22:29 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.58])
 by mx.groups.io with SMTP id smtpd.web11.43965.1731943346785060829
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 07:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=gtsfjN2E;
 spf=pass (domain: cherry.de, ip: 52.101.65.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqXsAK9lec7wqFs6mE+5VFPV88fDFrRaKpyM00EAKtBJHPvDy1/EWhkyjty+OGcZn7pDCWH9jhRXs2KycrcfT3rNuw/5zeq0tHOSPPpb97G75LaQNBb7wKx3U+i7Rt7JNCzTFtfxF3Vk7voavX+0bhTU8gcYKRtG9ekL6jVxcLxBMVFJfsuIFIvUmPu4MhfZdxPHiHLOdBa5bq9apo8f9Q4iVxPdnAM6UFU/mlsTv/H8FyNo1nhUGV/UPskViYTMMSEMG0hw6WBfJydHUyLGyILbgPkM17EuteF7ZO+QUzNDV/XFIVDCUTIb23IsaDUsUaRbbAFCgW7zGD2rIkijog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lo/cb80bAMz+zpjkVTDId61dWHid0LU+52G38OUhq4w=;
 b=l2f3miBj4ga49i1167786y7HmCts51k8PVIM8braD70ofQC7VRNQEu0GPkebbc5hzEPGiKK9wocwewN2UNvLE3927+0JpeaIeG0Qft57CJ2Mqb/Z7HiONdslT5U/bxf9uq0oayw+pihMc+oZCEEnoHABR5nomFppq+0vKZ33YrQKXRpClFiJlRvEyDLRsk2z8a0NHHh9twG7se50+OHIYLAOLg8iGzKGAWjLQTjiNmqNpCBTQnPHgG0Z0AIJOjbGSWx5I13s9auG/jrV95DIq6AOrXgVfKrbjE/JVkZGPg7AoBcmuKhEAp30K4Sfi+sBJsB+kzchUEwFqVC+BE17cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lo/cb80bAMz+zpjkVTDId61dWHid0LU+52G38OUhq4w=;
 b=gtsfjN2EoZzy1o/NlXAJMKChYyd2tnpDZWQDLE2GkmmZQ6bpNThr/KtS7t3ZwYDIruYV+R7vYKYDqhShYN0K3D2jXYyw1v4fFDFfOv+Lp8Dpkg7iZgIl2nlooLjAC9EUmVtDHbnVvlV+cTzrpDQFAfWwhYsejccXZTdAdgIEYTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GV1PR04MB10557.eurprd04.prod.outlook.com (2603:10a6:150:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 15:22:21 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 15:22:21 +0000
Message-ID: <b356e4cf-60e2-479d-b610-6bc72ffc4a3d@cherry.de>
Date: Mon, 18 Nov 2024 16:22:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH] standards.md: add a section on admonitions
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241118-update-standard-warn-note-v1-1-0407c16b9315@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241118-update-standard-warn-note-v1-1-0407c16b9315@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::12) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GV1PR04MB10557:EE_
X-MS-Office365-Filtering-Correlation-Id: c19a0f5b-71a5-44d5-327b-08dd07e4cbc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cUcwWnRGc2NlZmVieHlsVE1hbWd0WTMwOGRiWWtUNGtINTdTK0FzeE9XTmtV?=
 =?utf-8?B?WjhIM2dIbDlnREVRL0w4aFlIQTd6YkZvOU1mV2QrSkY0RmdxMVptdlQwZEw0?=
 =?utf-8?B?NjhSU2hHQ2RLWWRZbmEyTW1VaVpiQ3MwZEI0L2ZWRmY0eEwxV3NJVHNWYmNQ?=
 =?utf-8?B?cG9aZW1zTXlSVGRwTmxBLy9DQzh4NkJBeTFSWjhXeUMxekxhbDhweitscU9C?=
 =?utf-8?B?S3JhRExIWHJseUFUQWM2OXU2UnUvck9HTUVaV1Ftd2VOZGpVcnUrK1FuZ2Jz?=
 =?utf-8?B?aUtJTHdiT0tHTFRCNGtGT2ZqaTdFMkwvN3ZLQXUyZ3puVGlYbUdjOXRwUDBI?=
 =?utf-8?B?UzJFMW9USlM2cDNZT0xoeDNYTHQ5Y1dFZVdvNmswR0tSb3dHMDFJLzN0L1Bt?=
 =?utf-8?B?VHBMcFNqeUR3U1VJSjdOTnZCcXdCMXVIbHY0b2hBOW16MWZRNHpVbDZodmpM?=
 =?utf-8?B?a1lib1ZnUXMzbTVSNE4zMlRyOWQySTY1RVpkTWx3eE5KVDlsV1ovc3dBTlQ5?=
 =?utf-8?B?TXU0c2lNYzZFWTlFRmZXR3Fhb3ptVERrUUdJMHFjVHkyWHc0cktJUnkxa2dV?=
 =?utf-8?B?WnYzc3gvOC9IbFBIYWRHUENNSk5SWnpYamJqZVV2cHorNVhBekFFNXV0ZEda?=
 =?utf-8?B?WkMzTlhLUHNjOVF6NjlwWGMvdnVMcTA1aEJoc2xnZDdMalhUakdMVGxOTzho?=
 =?utf-8?B?ZHpsaGxha3NVWGMveENiWng5WjZxSFNTSkNxZjJmVkk1N0N5UFY4ZDZ5MHdS?=
 =?utf-8?B?R3VwTFJIaExXOVpYREFKRG81eVgyRUxJYXVTTlFnekFWaGp3dm5SYUVtc25S?=
 =?utf-8?B?WDFvZG1sTEc2b3RHMEJCd2F4U0V4ZC9lRGtwajNtcDQvNHpIREp6bUs0TWxu?=
 =?utf-8?B?ZGttWCtHbGdWU3VZVmNVZE4yQ0V2SllJdFo0Vk9acThtcUJYMnlKWUx1L1Ni?=
 =?utf-8?B?d0tod0psUXNoZG5ENFBnQWM3NWVqNmxGeCs5aklmVk1jYjZEd1JlL3dNQWRo?=
 =?utf-8?B?NWFyV0orWDkxaWNUYW1NV0VDdVRqQ2RYTDg3QXcyVjcyNG43Mm1xU0dBaGhj?=
 =?utf-8?B?UkxUL2RWdnBnVHg3WDlGUC9NKzlwZkgwYVJWNFc4ckJ0RGhFVmI4TDg1VVU3?=
 =?utf-8?B?TDd3dWJ4TDNrc3hjU0ZST0N5bm0wUVhTaFNTYVV6Mm50UDZ2enFaSkNtbWdL?=
 =?utf-8?B?UWszdjVWYmtBb1VlL0F1bGJJNmZmaXlNM1IwaERZTU5hZURrbjRXUG1haU1N?=
 =?utf-8?B?VVVpeDc0ODhKdEt5WXVJL2NKSlFvSG1HMFNYcC8xTG9pY2NWcVVUWGJ2WmVJ?=
 =?utf-8?B?bklLdGVHNHlhNjVKd2JNbTR1WXZLOUhCRW9LbEVmQTg0amxydlh5NHJ1Yy8w?=
 =?utf-8?B?WVBobVRZbkpuR2dXbGQ0NzdRZG1iQXNRN2l0VUtqRk54N2J5ell1ZG01SkF4?=
 =?utf-8?B?QmFNZ2crZjgwOWZtWWxta3NZRCsrd0NXNHZiRTEyUDgrdTRXMEs3MFFEQlpt?=
 =?utf-8?B?MkdndXVRK1c3OGdNT1A2ZHFjcUhUN1RSSmVVQmhpQkVCWGhDM2I4ZFdpSTZW?=
 =?utf-8?B?a1I2NXBWc0E3YmlFN1NDR0FJSW5PdnR1M3FKTGh6VjRnVUo1d2dOMmpDQnhh?=
 =?utf-8?B?UnFyT1hHdXIxSTUzdFl0OGVwcU42RnY4dERlSDdQemlydXUzelpyMWtLSUFH?=
 =?utf-8?B?aTVlMWp1bmxKVVZWRE04cG16d2ZzeVYzM1FHZ0t4Z0dsdWovOFFzdW5VQVVK?=
 =?utf-8?Q?qZU2TaPyhqL3iam2z23O1cWBOmySv0XavdpVC9V?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TW9Jb3ZaZFBENWRjTklrVzFjaGgvR0dlcVNpN05zUm5UdmR4NHA3UW5EMWZv?=
 =?utf-8?B?aXVDSkw1aEVMNjdlczlFNFp3R0c4cE5MRFllY3FSRk9qTmVxdjBDbVl0Vzlu?=
 =?utf-8?B?dG1CSlRmRUFMWVdqYWlSRjNsTTduWjFReWZSS01MWnM2VUVQRWcwcE53YzJx?=
 =?utf-8?B?ajFCdnZZTXMzWjZ3aW9Hd0dhbkZHZlpkODZta0Jud1pQaHgwNkxLWW0vNCtj?=
 =?utf-8?B?am1PNDV0eEVwR3J2LzhsOHc2UkRjY0pyNTl5U3NuYTgvaVI0Zll2Wnd4SlhZ?=
 =?utf-8?B?ZERKUmFPR0ZQVXcyVEpFeGtVZEV5VmVvWjEwbVhqRFJuM0R3VUoyNVRsSzJ5?=
 =?utf-8?B?RCtya3JPazdGbDJTVFZqM2ljNHBnNEZWNDArSDNBZ09DSUtUb2xaWnZBMm4z?=
 =?utf-8?B?R3dnaG0zS1lkbUxEcjZtYVFNR203aStGYXQyekNWM2RjYXQzb29kUVRoekJQ?=
 =?utf-8?B?NnhuQ1JjSSswMXZjRFcrbmtjdDFEbFg0c3c0TGlacXI3U1pXQi9FUWhuN2pD?=
 =?utf-8?B?bkQ1K1FObEJsWmdYNWMxUEx0c3puajVwREhIc25YSzRCM1ZOUm81V2h6dE9Y?=
 =?utf-8?B?OC9KY2s2a1p3WEtwaTU5TTBGaStxeVhDUmxsN2Yrd3Bwa3FWc2o0MEo2QkVt?=
 =?utf-8?B?YlE3MnJoMlRyVkRXQ0FFdURMNk1KOFA3bVZDOFgwZ1VVN1ZCNTlDZ0xCU0hS?=
 =?utf-8?B?QkNENFlwR0RNaldQUEFVazBCTzN5Z001NFQzeFlDWi9oS1ZtVGY2Tjh6OGVO?=
 =?utf-8?B?UFFmVDN4ZWZRRlBDeGViMkY1RkVMaFZ5bXV0K3ZMQmtWc1pRRlNhOGc5S1Zm?=
 =?utf-8?B?YkE0eW9zZy9EaWFOTitVaXdLQnd3cTFiaGpMdlF1dnpSM0xIMzdJZ1U3MDQw?=
 =?utf-8?B?eERJemw4aDVzdXhoRGpCcXltYWROS3JoK1JqaXJVSGd1blN6NVQ4L1h1ZmRH?=
 =?utf-8?B?Z3RFWG1xSEJZQnlMUHgrMElEOFU3NjNPMVVkQ1RrdEREWTkwcnN4dm9OM2hh?=
 =?utf-8?B?eXB6d3ovT2NhU281M2RpNGdhMTRvNG9mNXhXdmhIUDVlb2NRa01xcVhzSmhl?=
 =?utf-8?B?d1dxMGtEQmsvNU9zSk92TytNMDV5a1hTUUN1ZjNWMERPU2V5Zkp3cXppcHBU?=
 =?utf-8?B?eXlsT0JVcmV1NGltU05rTHBUcFZaZFh3czdwTjdLTXdGNkFmSmh5VEtObVVQ?=
 =?utf-8?B?U01naVlmZUpaMmxmZDlkWFZNQ0hyYVlwZDJpRG5uaEdxdFc2Rm8wWjh6QlE2?=
 =?utf-8?B?RVAwTVAxc3hUUUJRSjZXZSs3VkNnTjFaMUwwUXlLVkFZckttUk1vSFVKbmlo?=
 =?utf-8?B?eUZ3WFIxSmdrMU9LTC9mWVd1bHN0MGxBcnRrdSsxKzBBVTJGN1g1U1l0d2Qz?=
 =?utf-8?B?b1l3M3FTTWYrbno3VXdNVnZtNmxPMlRBdU9FUUU2YzB5SEZlenRLMEI4Z0to?=
 =?utf-8?B?VS9FN3JEOTRaSUdYeVRLVnA1NlAwMVB2US9neldvRVE4aTkvVS9SRkF1Y1lZ?=
 =?utf-8?B?MUM0RG1ELzhFTmJ3cXRRd0x5Tlp0aGpyQWFsWXRUN1kxaTVoTHBTd08vYWV4?=
 =?utf-8?B?VGYreDNZVVQ3VE5pVGk2UTlra3JvQW9EWmY2WkEwcElRR25jWnhGTmtoWkRy?=
 =?utf-8?B?c3pKSkxIaERqczBOa0FabFZheGNxaUlQQnFUVkRSbUNjL3grSnZ2Y1JDdXZK?=
 =?utf-8?B?QWpqYUYwTjBEZnFhQnZ4TkgxaHpYb2VqOVJhVjJSMWY5M3ZLUEFEUGhwRUll?=
 =?utf-8?B?WERMV3lVTS9VSVhBR1F1TThDdzFZQmpwZkVwYTZUN0RWQnRXU05DcFMxRlc3?=
 =?utf-8?B?ZUl3MVFqZ2o2S205STRHYXJqcWlLRmFNMTdFSnY1SWFoaEZ3QklXMnRaZEdl?=
 =?utf-8?B?RWRPRzl0cTJ4a09vbTZsUEZMWUlTMk92dFZoaUZxVDVJd1pDbXBUUXF2TDV2?=
 =?utf-8?B?V1Fub2Vud214ZzRUakZSY2FwVlMrY1VNYncvTTNTZmxnYVBjZUtqQ1dZdXNy?=
 =?utf-8?B?MmdUOC9Wc2dXOXp6QlpXMXRwd05PMmwveU05VnlqYWtZNnpaVmpoaFhOQ3k0?=
 =?utf-8?B?TWk5TlRQdXozR2piK1pHeDNqUkJTTEE0aUhOZmdBcnM2RnRlVi9CeURBWU4z?=
 =?utf-8?Q?XvheH/rmZ8nE3FbLFlmuEpfFh?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c19a0f5b-71a5-44d5-327b-08dd07e4cbc3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 15:22:21.3468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gr9QqUOCL4IYscnOzpcD7CA5x6yIzLglJdmKUiMTchJk61acECdoSVdDDwoQAwUA/prUdPXM5cMQOKQy2sevyJ4kxJ5jwyJNjx0AyskP42o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10557
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Nov 2024 15:22:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5760

Hi Antonin,

On 11/18/24 3:24 PM, Antonin Godard wrote:
> We try to limit our usage of these admonitions to `note` and `warning`,
> as the Sphinx documentation warns that most themes only style these two
> admonitions. So add a section on that.
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Looks good to me,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

