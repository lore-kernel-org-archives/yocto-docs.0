Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F632CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 13:10:35 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.11])
 by mx.groups.io with SMTP id smtpd.web10.32363.1761570631537784527
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 06:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=neIx8QpZ;
 spf=pass (domain: cherry.de, ip: 40.107.159.11, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mkj6/+YXT2R6eI+lal2AMVHBSgDF1nO1usJ69GNSIPlxTX5x1sNGzVhM/O3BQuYpmXJn75PtVX9ERPgmSNqNZ48nW2pYMex2oJRNNp4kr7RPVZyhWDXceBFq50NJq16z1a0NZOYxFCn32b1CABXo8JZzWX9C00v8otK+OJchw1/ETlZdOPPfOa3w4ofLavMuTBcJ10R1XCSncJyuUfa7FbODCqC4khyI/VnAchoIZSPK6unkXJAhNyDCK22vxj1MdpGynjL808pXmPP+n0abEFJSkDqcmgjRca0tCCGOejEwNQ7vpEI5U+MafA3clCaauFasohJzcWkqHFvFNxM4Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Agx6QtKuypOZrpkT5lC84aHrrVscstxvmLTpzlfqFBo=;
 b=WTGfaCB2o7QfntqYz2eAUkqMVodOg65mpC2PTjq0M7HY+bmuMBPp01la3XRaulkqyl/qxtYfjLRcJ5lV+Qf9NOkgqWD/o52GYx++apLX0guYFzl806TOPLUS4pwwBvBKqr+f5GZPY8PzsUDEexaTPz0C9rWoYKlRTqXSzdWt5OxMszOFNQ1MBBA0gwZuotjxDYhjwb+vJgkg+lN+JOv3i6sET8521ju68NvHd6DAD+9m5Vm8UoaBK21KegYTQheTf5r12UjSy4DuaTyvvSgqVxhD09gRSMNbi56W/UWucIg/Q3ak2Z4Vm7mA0TVljKJm6A00Jj5tk3Wdcq8tOrJ1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Agx6QtKuypOZrpkT5lC84aHrrVscstxvmLTpzlfqFBo=;
 b=neIx8QpZTZ6ZFIa5MYM3zN7yY5hAGFohR6Qls4btqpQrtyLTQuC9nsBDkJqJmMXcw2PKo6YlgJaUilvn9iRneRk21AJosYjiZ+QJbb6MrAmzKjSZ9mAQGRcR54DEX7Kn8FJBli+sQkD/Gr2TNf3yhOTaYi6qSD+rnD+vSHXD1hw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10726.eurprd04.prod.outlook.com (2603:10a6:150:20f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 13:10:28 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 13:10:28 +0000
Message-ID: <bbc27eba-fde9-41a9-88ba-ae572bfc28f3@cherry.de>
Date: Mon, 27 Oct 2025 14:10:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 11/16] ref-manual/classes.rst: gettext: extend
 the documentation of the class
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
 <20251027-release-note-5-3-second-hunk-v3-11-07d36e2380b8@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-11-07d36e2380b8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0302.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10726:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9ffb6e-9972-454a-c550-08de155a331a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eS9iRDlkUVBDN0luK0o1V1NiV09FcTlCZm0rdG9mWklTSHY5V084UGdQdDMr?=
 =?utf-8?B?Nk9uN3JxK0VPeHZpbDg2emFnb3RiSnpHeUVHVU85WnJGL3BFaDJoY0h5MVVj?=
 =?utf-8?B?T0FJK2RzTUdDZzZFenNpRSt5T08xT3RiTmFPMVBVWUlrcUNTT3hVWEZEOUJu?=
 =?utf-8?B?Q2NqUXlSdCtpTEd2RUovYnp4ZWNLUjZnUVFsZGJPRkQwS0FQajNLM21NcERV?=
 =?utf-8?B?blVrZ1FrT2xXOTdxdmh0bERnZHZBb0ZUYWx4L0FKOG9xQ1FCT0w5OCtValVr?=
 =?utf-8?B?MEdQZUY3WWxoR3kzazJkY0lvSEZlcTk1RWYzTEhnVjNnSEJvNUs4TVgraFlS?=
 =?utf-8?B?UUdPa2JteWZqZmNxckxlRUlXSVVVRnliNUxNOEpwNk5nWmRTL3hkZDJxbnFj?=
 =?utf-8?B?N1kyMFhlWVF3SDU3alNhVmNWNVhPVWxva2NKRUtEWmdFMjg1ZE82WlF3cGV6?=
 =?utf-8?B?YU5CYXptWUV4OHNKWEc3QUJjd2RRdHM4aXdBL2VGTG5jQXZZSHFHK0RrWlIw?=
 =?utf-8?B?WGlRbnAvbDRwM1BNM08vQjRRcG1mVDJTWVhaZXFNdmNuTVBXa2p4NHFnRjVE?=
 =?utf-8?B?ZzNia2pNaTZBQ1ZPMHA1OFRkOHpJZlpKN2ZnamgzVGQ4UllPQWF2aDd0R3pm?=
 =?utf-8?B?dlVHYUtaSVl0VmdsYlJnVjg3UFNQZWgyQnFzYU5yV3dxVnZrR2FPaVVxRE9Z?=
 =?utf-8?B?S1V6ZWpQMSt0SjZtN0dyYXd6bG01Y3I2RW1YWEJFcHVZakJYcHpOVFMzMmh5?=
 =?utf-8?B?bHRrMkhQWE80ZzY1MlEzQ29yRGhkbDE2dU9ucXJ2MVdzN3R4NmJ4VUdUMjRm?=
 =?utf-8?B?cms4QTFnMWVWN0RySnFxN1o3cjJvR3Zsc2EvckxkTjY3dFQ1VisvcEM4eGtG?=
 =?utf-8?B?NkQzUnRMbEJta2llWXU2RjRIT2oxWFVVU0FHNzBQeTZvSHgzdUhaQkhTRU56?=
 =?utf-8?B?N3hCd3ZuaGxLeEMzcUxGV0VNTmNLQXZaTWF6QmFER3dmTXd0QXBMcDc2YWdZ?=
 =?utf-8?B?OVorMGVpMWVrMy90WExsL2srWkV3eUxsalNRdjRlT2JKaUt3K2hvT1VCL1F2?=
 =?utf-8?B?YzJxTnV3Vk50VUNRTERjdHBKUFczVC9wdks3eWJ1VGI1R2s1RGY2SnZ3MWNo?=
 =?utf-8?B?ZW9OWlkrazZMYXJ0OUxMbGZyRDVVOTBqcDlPWFBuZUwzTXc5c0YyODRwOWtz?=
 =?utf-8?B?V1RRMWdvakl3VzM4d3FITUkxbHk0RTBnK2piOE94WjgyQzVEYWFQcWI1enYy?=
 =?utf-8?B?a1FmOTQ2R1NRaTVJU01tQU0raDd1R3BWOW41L2NiTUlTdXUvYzU0OFA0Z0p3?=
 =?utf-8?B?UWgxMTBabzArOHZCL3pITHVjT1lHckhiVmtSVzhkbXYwQVhjb2g3YWVSTjdK?=
 =?utf-8?B?RXhpTmlXTnhkWkN3MzdjOWE0NlJKRHRHaTBzcEZ3R1BYVEZlRjBqTG5hWXN5?=
 =?utf-8?B?UlE4ZTFPTkpMQkhOUmVLTFZGZy9XSGtqM1d6NXRvWHp4NkY1bERKMEdhcnhu?=
 =?utf-8?B?ejFKcy9jTG1PVXN2eXBGYmdHR3U5WldNT1FpLzF6QkxyS015c1VIbXlOaEtW?=
 =?utf-8?B?UjYydjBxZEpBZGhSbUpxdHJlQkRQcWpCdjBmbVhQVzcxN0FtVWRYenVtck9L?=
 =?utf-8?B?WGdvdUgvb2E2V2NROUFqV0tDT1EybjIzWndMWkdSN1luNEJVODJ6aXFhZmNs?=
 =?utf-8?B?dFoybkxTS1V3UHFnRU80RzBIS29SNHhOci9JUHB6YzZpWVJwOVFkY0I5ekJ2?=
 =?utf-8?B?WW9MdG5pa2tZVDhDcHc4OTV4M3poOElIYklOb2FOelM0Ris0eitoT0VhMUk3?=
 =?utf-8?B?SFFvL3l1VEM4aTFDanpGcHQvVXlRLy9jczdoMnp0aW1POUkra3J5cEpZZHRn?=
 =?utf-8?B?d1dHUFFuTG9GUTZvOStPM2FiYmd6MGlobWtKTjFrZ0RXTCswTjYyc0xBNGpQ?=
 =?utf-8?Q?NDWoDrc2cNIYfCDLxYL9JOmbHTdsits1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SEN4dG5kVS9La0dwMWphM2xkRkh6YytHaUV6OXNTVFVENHVrcGxrb005RmVI?=
 =?utf-8?B?NmN0U2RVL0gvWHFuTy9QNzM1SEhEZDRwbWNBMEdNVGVpZkUyMTdjd0JkMmV2?=
 =?utf-8?B?Z1ZOUnhyOGs4aG9aa3RJNWRaNDJPQkpONDg2TDZjbk0vSzBsQUlTRnFiZU9T?=
 =?utf-8?B?eFpPNURpNFppcUd6V3BXZ1pkN1loNGtTd0J5Y1FVU1J0b00yMkRJSTBlTjVH?=
 =?utf-8?B?N3VleVpLa01iZHNOVkZZM1RPUUJGcTFNOXljbnlZTG9nbFhwajNmZk5Xa25q?=
 =?utf-8?B?VTBnalhKeXVPd2hIa1kvZS9MakhYaTludGhYQ2lXSEpQUTJJRUZraVdiVjlV?=
 =?utf-8?B?V215d1E3RnBCOXJzc2NmSDZwM3dtUitGUkIyTTR6d1FZaWhxOGRnRzdpTUZY?=
 =?utf-8?B?d3E0dzlxTVBPMkRaMGIvcmdXZDBtK244SHF3aGpkZ1ZDZ2JEMi9YUUF6RXRn?=
 =?utf-8?B?ZldaU1NQb2RIUmJxbFlQS2JEMjRad0s5VEJ4cnFJRTN0dTIrNnhUQnpBUHI1?=
 =?utf-8?B?VlkySWQ3Vmg3MVY3Y1U4bnc5ZU1ZOEVMcHFSdFpkYlRjWFZHS2UzbXZCZGI0?=
 =?utf-8?B?K2wrL2JlbU5zT3crV05nbWtWcGtBZC83NDdZYTFhL2JKNWl4Rk11dW5icXg0?=
 =?utf-8?B?dFNPdTZhS1hGa1FRUmN0L0JnUEZPVDlTYUxldHpZdGhmb1NpM2tLVEFBZFpS?=
 =?utf-8?B?cnZVY2xYakdMMTJIOTV5VWMrM1hoTmlZWEI4MzhNRllTdEt1a1RicnZIRkc4?=
 =?utf-8?B?bkhHL0N3NXdkT3BsZHdzbVlCRU45MFVCRzQ4T2FvTDlER3BxaTREeEdBMHd0?=
 =?utf-8?B?citVL0xaMjBwT1FKWlBJUmlWU2FNODV2eHIvb2lDTXpzNW5pazFnVkVrZkFu?=
 =?utf-8?B?c1MvRzJnVThhSHZwMmViVWl2Qm9uQ0hQK3BWOWowdGhpaUlIY1FocGxuODZi?=
 =?utf-8?B?SS9vOE51SS9tQnBkRHkvakRmUERodW9uTGpqTGpGR0FMeVQ5dkJHdkh3dVJX?=
 =?utf-8?B?TkkwZHlmbzFBeEtxeEdITW9jdjV2OHVseCt6VjFLaCtUTWQzb0phNDRHbDYx?=
 =?utf-8?B?ZVFwUjdQNVhsR2NsOUhXSkI1RFJSakx1emFJVzduTExZdjdKREkweDUwQXZR?=
 =?utf-8?B?KzRsaURpUkFDVEhJdzlZL0pyVFZyMGlIVlpZb3BVRlhWNkIvVmk2NmU5OUZp?=
 =?utf-8?B?Z05mZmhMTUg4dnFna1B3aGVGSW9TSmZnV215N2RLZm5qekIyaTJSQVRhZ0lz?=
 =?utf-8?B?K2JkM1dOV2crYVpUUjhvM0xFb2g1RzJhQktXWlhaRWNKWktSeW9Hd0Q5OG1r?=
 =?utf-8?B?dXRYWWNFQSs4bWlKN2FNSXFMNDNLV3VYSGpMeGVUeHIwNUhpdjBMaEN0NXJz?=
 =?utf-8?B?TGhhZWZRTnZBZVoxNGdSQVUxaktENlBCdks3dTNhdHFaYzd0c2RpTUdhdGNj?=
 =?utf-8?B?NWk5MThEUUhuY2ptOUtrejJNblR5NUZtY2pJZllCYWNTUU54VisxSGVpTGFz?=
 =?utf-8?B?bk1pV3c0UklkS1VkcjFqUVVHTGRGSmxPT3pmOEZpL3A1THAra1h2bUg1T0N3?=
 =?utf-8?B?c1lmWVdoQXlqcDZQUFZKNThGTkx3Q0l5eEo4VTBncTg3T3Vvd3NpRXZKN2kr?=
 =?utf-8?B?WmFHVFBCbnJ5ejhnUHdPSmVRTmlpSU9jZzFrL0ErQzk1bEZjRjN1alZpdmZw?=
 =?utf-8?B?NnpxSzJtRVBBNVNXT1RvbUhaSWNVMjBGb1hTNUlvMTloODlQNlJTTmxiN1BH?=
 =?utf-8?B?cmlJR3pJVWg2TGZuN1pCTG5iam9yeTRaR3dpUXNDV1QzdldjdUV5RXNhbGRC?=
 =?utf-8?B?U0RNQUdIVnVYbGl0SGdVN29Hd2oyZFlDSXNyMFRBNzdMcTFnZ2s5bngvM3lW?=
 =?utf-8?B?QWZwRkRESWJzNVIyTEIrNDNua0RNMTVOM3VwR2ZHV0ZtNGpDd0hJTnF5ZGlU?=
 =?utf-8?B?UVovZnlOTFJwY09rVDRuUWV5blpPdUg4eklIMFJWclF3cFoyNzBqYkVrN0o5?=
 =?utf-8?B?b0NaQkVYcEZrbGVFUTdxUlRPMDJLWWwvWkJUcjFLTUc5TVdFZkNJU2tsM0F5?=
 =?utf-8?B?dldlQXhCakxvdDFsM003UnZDTCtDejFxS0dpb0kwYk13MkNTMWxwN1Z3cWlS?=
 =?utf-8?B?ak80M3hvZGU0M0pxWFlORjRJRG15STY5NytKdUhReTVGZ3pyOTZ0eWI3ZExp?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9ffb6e-9972-454a-c550-08de155a331a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 13:10:28.2934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+akzb2YbkJG32xQxRw8DlRSbNL8oSOubxZW2i9zSfgFFp97Y1hnsG9YVctq5hkw6d7NmNE+RTuKhAr84BRhYAlXDmyAreY8xF7TWsmwDiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10726
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 13:10:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7869

Hi Antonin,

On 10/27/25 1:43 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Mention the use of USE_NLS, INHIBIT_DEFAULT_DEPS and the cross-canadian
> class.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

