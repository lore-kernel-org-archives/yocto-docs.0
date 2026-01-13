Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D90BD2F327
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:16:23 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61110.1768317381889020074
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BvdCpy2B;
 spf=pass (domain: cherry.de, ip: 52.101.69.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VndfE70WRk1mvJsP/pFmma6SLOSY7ipPtjdfajk4DhiUarFCU4XLcGJ1CBiByC7YD9awvIeBleoPSxOywGv7N66im1vixlYlQWfhiDGA5dwHVeH1KxjgvM5uei/lQwuOT9FpF/aF8FEp4X3319zNAidYOdaEPJGGG5GYYKHn4klNHbUU6yEeYyKMe4LDjIgwyWUu6wFViTbgUhO054Ga4Isnuw8/jIWCAg7ULydaZamfRLlv21QV/2Z69E9Zl4PdftNP3myZeqMRujqULCEJTURwkfgBaPAupE59tqdGPdLDb3FCx6H48lMc/5E5RRl4BFF6uEKE93QXvPUuf3XGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEV+YsRvfltQl1HgnUdpOCpgPreZUw9BI7lNCDmwicM=;
 b=VG3Yk6lXK3i1w+lw/j8xQF17n0mxX4oSwxlbCJKq3uP7rtfwcfoKgOId0F8EHQBvPGdrwLjgVeVOyrbtdmL3QqDM4g8jcAkL5hxl2diXIVBfkvDKFL1p7q2VK5dqeAKoIeHUb0wIalvhhwntrHQOPKEmCQcAEvOzn2VO1c81PHzB6BdPbvF3sSkWWENoCwJmuwXkSaFqflRwJhj0YaXDSSgqWjDT46Fw2I/AcKw9DS7W/mNzJKJgCKNU7E5ybRak7xnn342OgBGmUCv5WYmQJ8osg9gLgoEP3LJhwQldJ8NrBA6TgsPUigQDxN9fepoCubpS4221THbDFtAQfbZYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEV+YsRvfltQl1HgnUdpOCpgPreZUw9BI7lNCDmwicM=;
 b=BvdCpy2B07Jhau2aDfVrS8D0c6iVIU204a20stwy7a2OF2UGW7jolSxUK4gwirmT0VF1AIOnXMFxBOle7ToV+NTRunURH9kMj6gfodfBzUosi5B8CLTLlD3Xw2mv+62P55U72DHuq2p+vkKW7zD23w/m+itedL/Q/cuC882D4O4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:16:18 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:16:18 +0000
Message-ID: <a44dfcde-6aa4-45ad-ac5a-0a7b0260beef@cherry.de>
Date: Tue, 13 Jan 2026 16:16:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 46/53] ref-manual/faq.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-46-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-46-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: b38bc325-1eb3-4d28-f54d-08de52b6b354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NGVEd3VCa0lhL056ZjNSV1V1SVhYa1lJQjhkTkxwbkpCdnpMVUlCM1BZYWh6?=
 =?utf-8?B?QXZyK3lpS1BQYm8zUmdBcGhISjdnOVV3S1YrRHViV3NVZ2lpcDRXN1NMbm5t?=
 =?utf-8?B?V0ErQURoLy8yNDJSZGZaeTlLd0orMzBQeVNJQisyY3Z5U2tGeXg3K1ovUTBF?=
 =?utf-8?B?am02US92WENlRm50UkJqSklVWWV0REJ2QnBnNWdxMEpZQmxnRDVwNlIwU1V0?=
 =?utf-8?B?emdTRHM2VWh1T2I0aGV6MVVJZkRkNDFidUtZaTJ1MUIyS214aVo3RWRRdU01?=
 =?utf-8?B?eEgzTnBFeWc5di92NVUzdkUwRUwrdThpY3loOFVRdXpCMXR4MW5BaFc3a1FF?=
 =?utf-8?B?WnV5aWRaQTMzWHRaZm5CYjNFM3lxN1NaZnlxczFFSVBBMHdCN0NKN3ZMTldF?=
 =?utf-8?B?bGc5dDhMZXpMc3kvanBJYW1lTDB3TjUwQWNpeURzM2VtWkVIVEJhUGUyNmFh?=
 =?utf-8?B?VGl0aW9GazVRcEg4aVVVMkVESEdYMDJzWWsvYmlFM1JvREdPeDAxdjFWRUp5?=
 =?utf-8?B?dU9vcE1zWUJZVkVHclRWUUJWaitYNXJSQ3JtUTBTOWN3Q1FkR1lTMU9YejhE?=
 =?utf-8?B?OU1vSzZTYzk5T0RXVlN3dy9wdnJtaURFQThWQkZGemNGS1hiUDZMM0Jza205?=
 =?utf-8?B?VGtXZVE3SUNzeTl0S1pDazFxVDN2ZHRIUjhyQXhVOEtqMkx1MGcvRHJVWFIv?=
 =?utf-8?B?S0RVeFZjbVJldHJQMDA3NyswSjZ1c1hhL1VEejJsTVp5bFNERmJacEJVd2Rx?=
 =?utf-8?B?aWl2UW44U0ZCWndlN2VCVVdtR2ZtTWVIWHNHUmdZN0NvZnhjTzZQbW9EOTEr?=
 =?utf-8?B?eVNKdytzSElkR2liRDloUVZMOElpUEUyeW1pdEN0WDQ5WHJUSytrMWljL3Mx?=
 =?utf-8?B?bmxMRzRwZERYODd4VXY3TjNWNTBLNStqdUFnUmFzeVNLa09OVUYrMEJIbktE?=
 =?utf-8?B?RFBkZVhRZWZaRUNFZkpJZ3luWG9Jc3JYREZoNW9Bd2hoOHNueFdKeE5nN04v?=
 =?utf-8?B?SndyM1JDMWhVcGFXVTFUTVAvZ2svZElhSTNXTDc1WXRDN1grTXkzZEUvNmxG?=
 =?utf-8?B?aGp6aHk2ME1BNnJQL01yN09lMTN6RzU4Yy90Tkkya1BXTkhhNHptWHE4dDNz?=
 =?utf-8?B?T0FXdSs3eGJYN0YxeTVRenVycENveVMxY0hiNERYOTJTYkY3WHRoTzhFTVZZ?=
 =?utf-8?B?K3FzOW9teHZxMnZ5bVZidnd6ekMyZVAyV2xsUHo5UFpXUWJQcXIzUnVBUkM0?=
 =?utf-8?B?RU5lMHhhaE1ibXpzUmdRSlV2Yi81TTBtZ1h6Yk1WMWRlQ0ZSNk1xYmdDcDg0?=
 =?utf-8?B?blRWcXJaMnpnSnV5U2dwMVZRMXB4OTVmSzlRNVVoSTlPV3drNFpHdmFrRmJQ?=
 =?utf-8?B?SXJ1SFhWY0pKRGpzY21PMmxOVVhtbmdIVVRUQllJV1R2eWJLS3Y4bzNKZmVa?=
 =?utf-8?B?c1k1cHQ3QzlObnJNaEIzdy8venBDZmRSdSswZXd2NTJkSVRUQTNwTVNDQWp4?=
 =?utf-8?B?VmhCajhlS3oxWHl1VUc3YnpBclp4UWVLR1Z6R2s3S0ZEMy93V25EanZzQ0Zl?=
 =?utf-8?B?SVQ2SzEwQ0d4azVINjN6ZVAwOTU0cThYalBFWnVhV0tib1l0dEd0a3lDVHFj?=
 =?utf-8?B?TDIyL1lyQkdhbGNjMFNyWGdDRjB6T0NVYURwS2xHWmluVk5uWUhMdFZNb1FB?=
 =?utf-8?B?dmxnNkpYV3QrK2syRHA0Q0F4U3NDWnpoaEcwMEdaQ0NSY1BVd0ZQZVpxS3pl?=
 =?utf-8?B?WktUOEhNa0pycnRTTFVNL1VMSmZuZUYyL3NTWWhHVE9NVDB2emdWajFNalBQ?=
 =?utf-8?B?TTNMeG5pYVM5ZS9OYTIvK2FNSGNXdkhDcUQyaTh3ZEVyelVXb2FyNEVBVTdw?=
 =?utf-8?B?dlFlczVUcTdsK1A3eFFTUk8zcmVzWUc5OE9HNHJzeVJ1V3FDR1JYN0QrK0Rm?=
 =?utf-8?Q?Hu3RvKhEbmNBqp74I7dApXBKAYnOG4NB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?amk4NDNlbWVhUkJ0d0F2N2taYk92aHR3dyswb0VIT3B3Uzc5aVNyM0ExVHIx?=
 =?utf-8?B?WGlRU3dFVVFpa0ZEcHIvVy9QR1RWS29SSnV5aGRJOWowaDdOOEI1OTZCYUIy?=
 =?utf-8?B?S0l4V3dycU90TjRwY0tsNVdGL1RGcnFpcmRPZVlyQTVqSTcwQkNVY3RoeDR5?=
 =?utf-8?B?WVZUTGtCMGZiK1p6RHV3enZjQllvaThxbk4wVTdDa3NGbHZmUVFuVHdKdTQ4?=
 =?utf-8?B?elpuQVZpdkVMQWZXaTVNcWV3MVFGVWl1WERCaGpwZWh5ZjkzQTJvbXhielV3?=
 =?utf-8?B?K0M3UVIvMkZqS1RtV3BzY2ZIMnBXTTJxeDdXMlg3MVZ5a0sxVHpyUFVrdHZG?=
 =?utf-8?B?eU8yRXdlNlBOcmlScGRSMUlWQ05ZbHRZbGVzaGxYZWExcHFkSlVkVFIvN1BE?=
 =?utf-8?B?ZitzV1pFcjQ1TWx3UnhsdFFjLzlsUGZHd0Yyc2JUNjdJYmZKRk4vcVU2MzBV?=
 =?utf-8?B?TGNyNlpOMTJiVHdkdkg2UGExbzRSQVViRkgrYThtUEN0TVhHRTBKZWxEa0hj?=
 =?utf-8?B?VXpBbW80czZudjFrZExwNVZLTitMNnUwb0t4d3BzaUdZdm41aTJuVGtXR2RW?=
 =?utf-8?B?NEVKcjl6MFVsWTBoSXBmcm9BNEJGMVRjMjJUWEh0VWRuUmt6QUZLUlRrY0N3?=
 =?utf-8?B?c2xJZExaeTdTdUdQMWdTMVBqeGx5N3dqaEJ6SmZWNzZCRC9WVXE0T3hQbks3?=
 =?utf-8?B?RVZnNU45MGRkMG9TME9XLzQrWUw0S2QyMEQvazByS0JWRUJweUlHMGdNNFND?=
 =?utf-8?B?Zm5sei9uci93SGJBUDJPUTcyZmlLNWFqSzFxZ0tINjZqN2Jkek5rTU9PbVo1?=
 =?utf-8?B?NDlPb3Zlc053V2N4RGtTc2ZKU1dsQ3NjV3R5dk40SC9FVmp2bHdGNTh3Q1RB?=
 =?utf-8?B?N3lYYlFRRHIyVTZMTmUwVEV4cFk2TDhKelJsUGlQeEsyWUEyUU9vbXkxUnA5?=
 =?utf-8?B?aXVlU0w2aDBiL3YvNUVpNXlMZ0NyWk9Mc0NwZ3BCY2NvWEo3N0xCYXF5Tmpy?=
 =?utf-8?B?WFZRQzFUNHI0eWkra0h0QmZRZC9sSHJaQllON1ZOSWV4dDR4Z09kUXB6VjNs?=
 =?utf-8?B?dGR6RkFUSWVBdGl6WlZCV25FUXU0OHAvc05MWDAyaUdDanloRXBERHRnRTI0?=
 =?utf-8?B?K2FQdHF2QXFwRkl5aXB3WUJMOGlEcjczZ0lEem45K2krbVBGZzZZTGFBMEcr?=
 =?utf-8?B?REpNNEZVY0xRRWRlZE1PMmFlUHhDYUEyWVY3MlBkVHVVMC9pZ0NzMGhEWWhq?=
 =?utf-8?B?N2d2LzB2bUEwVncrOTgvekhzNTRHZnlLU2I3SHUvNlBpaWtpUHJGWE95U2g3?=
 =?utf-8?B?YUFaTmpKaU9zUTE0NnZvU085dWp4YnZHQXhUZGV5Rm1UM3V1N09GeGlzK25N?=
 =?utf-8?B?SWk2VkxNelNQRm9Ob000L1BCRElqRjhQU1oyMjhzZVlRMGxoNkxYc2RZQ3hI?=
 =?utf-8?B?eGVLOFJZdEZiY0UvVGtqa2g2bEgzcmg5NlVpSUdZQmc5dGRmWklDZWFzVmJw?=
 =?utf-8?B?SStDQzFweDdvRVFBQVhQbTM4cVIrTUNaQVNNUnFhMyt2RmJ3STZpVTFQMTJy?=
 =?utf-8?B?cDN1OWRkMVNGR3dPd2lFNlFDWElwRi9jUEpLUGRkTzRTVlRReXJscnVEbzVz?=
 =?utf-8?B?c2N6cTlVNDREWTcvWHoxeUNodDhLemdGZzFqVGRENEpHQ0FMaHdpcUQ1Q0RW?=
 =?utf-8?B?TXBNdzBkbDVOK3lrYlVVNDVoZ013ZVJDbjFwdlllQ2N1dFFFYnQ2bENNTy9H?=
 =?utf-8?B?bUFUWG8waElCakV5UDYzSVg2ZlJ2Wnk3dDE1TllhdFBGZGFwcmEzbE5QSjBN?=
 =?utf-8?B?QWRrUUUyZTBpUnIxRmRISFQydEdzQ0RlbktpZ0V6VWtjR3UxazdUYzhRcHp2?=
 =?utf-8?B?WHZxTldXREIralJscU9QM2dyM0F1RDd5V3NZQ1VHZFNGSCsydHdPVWtTWlR5?=
 =?utf-8?B?T2pteXIwYlNjclo2MWpuQzZOS2ZkWDdselIzU3NIK1BVUmpQdDJGeW9tSGJE?=
 =?utf-8?B?RkxPMWtxcnBIZDF6WmhpVHN0TDhtTlV1Z0x3dS94K3U3aW5ZamFzekJUdjNz?=
 =?utf-8?B?S0ZVa203dEhnSDEwSUNRMHFuTkJDQit4UWlMS2NoSEJWaXhyZG90RHVsVFdw?=
 =?utf-8?B?VTN6clF2c09ZSXZBY081RGNaU1RvQjU4OTdnT1ZXSUlZZU1yS2RoYkxMaFJY?=
 =?utf-8?B?eFFFYllrTXkyVU5iTTRXRks5S1l1M0N2V0sycmxGekFTSlhzVGhvQXc4Vysx?=
 =?utf-8?B?cXpMQjIwRDNYUkdPM2d4enpBelEwWTRIQ290QnVoSko5d3M4MVQzWUNjVEx4?=
 =?utf-8?B?NldhdFA2bjNlUEZIdWZzM3pvWkZhdStuWTFYcjRhRGV3R2VMOVN4dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b38bc325-1eb3-4d28-f54d-08de52b6b354
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:16:18.0978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2BUjgBxiuLc0PrtWcVoY5Slv0SS4gos9MJUF8mN6qKaG6QNC66sxT4GhrxguLZC79aUzPr4mMr4CN/QwF75yllRTFP1wHonrFckuU3BxWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:16:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8535

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Rework the difference between Poky and OpenEmbedded. Copy the note from
> terms.rst regarding the now obsolete Poky repository.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

