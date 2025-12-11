Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8508DD41C2E
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 12:28:32 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8119.1765456092890239758
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 04:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TH4lqTlY;
 spf=pass (domain: cherry.de, ip: 52.101.72.23, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UitTqBMPkOiMItsbcbJErMFlUc75bUF/ZTl8CnQ3RTekF7QaNYRuyFyMDL7lxJ7wJ5TXYWmzTezkubjsow8oRP2C+qGk9pXbb9T4kVoEnZj2h8n/Dc3tKqBMJI8BJAi0ZeQthGxM/xw+jRVi6SFf5Kv/J14kISTnNE1XOuE5hhg6n0Svel/ijEa/rLv97/WYPExydr/y73bTWtr++wZNWqlZPcv5/okiy7Q0pU+NjToZgqVfGtJD41swDAyMeDDeWrrQRuG5xBCqQ4gfoIcBuDGgCEHtwRE78Ulxb67W8Oqt8IN8TOtVtgUPw/AwTDK5vxY3ZmFPfsdXu2PPQ1xDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4pRQurBbaIM4ewxB6LKQE4cNmsqxgdAtcvcbl/4RRs=;
 b=mfhDqosxkqEmqdjB+c4pQvRW0tRFzcxIPL5UFsclgHPMjlGFUWV3jcOyTl9cCXiljrPsUCZFA337CGyX+m+KFq/RbzUuFHKG80s57Db1/w3EwhfC4DUq5RqxEl5aGj5Z5LHJvANupv601NXUzmS62QCIm3SqzUHMueIDpdw30f/yB4+zTyyjqqrgVWbD3gKcX4OCL8LPk+zU7RGKKg+LrAG/SfDnJx3hIgxUx5Thhk9zDyYSQBkwovYiBI2S/meM4zzPPL0kXu2UhX/0iSKnAuqwXJJlbvVUOScSpLyRrNobTXrhcc4/4nK5QH1ipo5zmDrwrQ1N50BogfQc/ZIpuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4pRQurBbaIM4ewxB6LKQE4cNmsqxgdAtcvcbl/4RRs=;
 b=TH4lqTlYkolDBVO+EuG4HttHRl2Ahc033lxBC4CzqndB6uEjY41Al+bsClXnHxe1OYkDeF1/uKY09gYaXBi6Eu+qYrXfMvyhfLMNc1qT3rrJPRgia/scZZhMkheX+G0JacW+nIab8dnDBY2Sl7xZOIRYeBVhC3h2qlHLeIxVON4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10867.eurprd04.prod.outlook.com (2603:10a6:102:483::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 12:28:09 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 12:28:09 +0000
Message-ID: <03999781-3d50-4137-b1b1-86adc6e599f3@cherry.de>
Date: Thu, 11 Dec 2025 13:27:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 2/5] Makefile: fix rsvg-convert --format
 capitalization
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
 <20251211-build-docs-container-tlmgr-v2-2-58719c103a50@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251211-build-docs-container-tlmgr-v2-2-58719c103a50@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0064.eurprd03.prod.outlook.com
 (2603:10a6:803:50::35) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10867:EE_
X-MS-Office365-Filtering-Correlation-Id: 50458981-ae9f-4c9b-bb1f-08de38b0be25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UC9jTVlFVHk5clBVL2xJUW9FM3JZWm01OXV5MUdIcHBOS3QwZ0RZNTIvVldD?=
 =?utf-8?B?TzBDVHRaVzNJRW9xQldrUFNYMG5qd3hMMGF2OTQ0ejJsTFpNekJDWkgxakdH?=
 =?utf-8?B?OVlCSUVaYzUrcVE5Z2Q2L2FFcGtZcXlqak8xREhjcjhKci81N2xydHJySVJ1?=
 =?utf-8?B?SnNnZ0t3Qm4vR29UM2Q5QTZWZTBDYXFuRlBVcjlQMWd0NkVlZ3hONHBkYVpu?=
 =?utf-8?B?OU4xZGxQaVFqMnF2WkJzYWhPZjJJYXh1UU5YSnpIRUhveC83ZlhkbzJwRlAz?=
 =?utf-8?B?THNISjdpMEQ0TDFYOHVrNXYyWVV1SVlFS0laUzhhUnEzWS9URDNlMS94UHlL?=
 =?utf-8?B?NG1VZWo5T0pFMXVsM3d0aG8wYnlmeWNkNkdRd1RvT1hnNUlaZGZTbFdJcENZ?=
 =?utf-8?B?cVh0QVc0NXAwNUlUdFY0NGJlVllWU09JdERweWRCM1lFczN2dWwzOUVEVzlJ?=
 =?utf-8?B?emN3TmlKR29kMkZtaHkyaStheEZOcVBPWDQ1R1ErZFJPTEp5K0hTS2ZlZlcr?=
 =?utf-8?B?dklIV0RPcGdHdFowekVWdjhQWFgrRGtvalh5Qjl3QlFNNitycHFDWmc0b0hn?=
 =?utf-8?B?dWZQU0hkM2ptdE9KUE92Zit1U1cwcE90Z1N3QUx5TUtkTGROOW51d2NEN2dm?=
 =?utf-8?B?MytOVUVyNUh3K2Z0N05tRHJtakNnN2VKOVNERDBiVmNsRnhKMDM2N21lVFZi?=
 =?utf-8?B?MjVCRzVQT3FySnpHNUorQVpyOVVxbVZJbTA4VWg1Rnh2UXhDZ3E5cUFQd1p2?=
 =?utf-8?B?NmxLa3NER280Yk9kUGVpQ1NZSjg1eTFvVE5hSFBlcDljZ3hkSGNNbU01ZEJq?=
 =?utf-8?B?VlRvK2FsVG9KeHZLUXY5d1g3V0hUL05JekJaVjBmNlYrc1hMR2Z0QnUxZkNY?=
 =?utf-8?B?eXBYZDExT2wxNWRZeDlkM1FTYjZSbzBjQTNPZUpGODloNEZ6QTZMOVNpKzJE?=
 =?utf-8?B?a00rWGpvTUdiUkxFRU43cTBJV2ZzUTFNWHFVQ2lCNWRPbUVWeExQMWplS2Y1?=
 =?utf-8?B?N0lXQ05JZk9IeWkzT3hXSFlYU3FWUDFqNFZTWXU5RXlmbVFZdGJUQlQrNWh5?=
 =?utf-8?B?S1hPYkNqV294QlhxVlBXaWJHamIwYi9uY0VQeEY0bzM4QVVjdmgvR1AwRTU0?=
 =?utf-8?B?d0xQSSt6NzZEa09LVVRsck4vaUQ5RXhMVURKZHNxN1NmNnBvL2l2emtFMWNz?=
 =?utf-8?B?aXhHdm9RenhHWWlEUkMyT2tYa2tXaFp1T2g3SXBOUkNWZDROZHg5WEdrSUdI?=
 =?utf-8?B?a2FQSmphM1NCeU9zMm52OVdMMC9BMitzU3M2dkFqRmpCZmpUN0s3RHZhZ2hG?=
 =?utf-8?B?SjVJcHUvU04wTFlaNDdnNDUxeG5sVk1PMzRYYklWUnVZdWl1ejdtSnN0TGJF?=
 =?utf-8?B?QlU0RCtOSnlBdHhFREticHhiaERpN09PYlVFaUxqQ08vNHRoUS9wYS8rNyth?=
 =?utf-8?B?U1JrdWtGYjZkZVJhcW5VcjBxMGhBbE0zSnpkZWt4MWdUY3M2TjZrY2U5anVq?=
 =?utf-8?B?NFdTOUtwc1BNejhvUklvaWJVTEIvUjMyNEN3RDZXTmF4MTVUNklXVTRHSGkw?=
 =?utf-8?B?YUN5M2hKbnVWV3NzcHlNbUVzVmNYUGlOdkJ5bWJ0WXBmRklaVCtvNGdaVm9h?=
 =?utf-8?B?aGZVNlpWOWZnMlYwemJKTm5mZlZBZEY5THRweVM3TjBVQ2dCOWo2OEVFZUxL?=
 =?utf-8?B?ajVwNFoxNUE1emh6SDVmVTBiVC96QnVOWlMwQ2VabmtoUkV0N2hYZlA0ZXZP?=
 =?utf-8?B?NVJ6T01Ib3RKelI1Vi84OXhjR0JXOG5yY3Q5a1drcUVEMUpRQWg2SFRjN2tU?=
 =?utf-8?B?WEo4Z3hIajJNbWFBVDVJdnJvR29lRWxlTWRvcmhkUFJwM2xqaTY5ekw5cml2?=
 =?utf-8?B?NVlUYkU5MzhlSTEwQ1psZm9TVUthUGE0RE9yZjNUc0NJWDJDQmJyZFZ1RWxW?=
 =?utf-8?Q?hPuPlexN4eBdEJsg6LXd7qcVE3PSBLSD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckpzR2V6NWFlTkxJSktrNEpFR1VqUTdBbmthSTZVeDdJVUJZdFZXQmIwR281?=
 =?utf-8?B?ZWMyUFRrS2hmdW51Z0JXZnZXZGo5ZkM0WjRGQ1B0bHJVUzJUUkY2ZUx1RlB2?=
 =?utf-8?B?d2VFQVB4QUpNYjVLT0QrV2RHdk9WRWtEQjVMeTB2b0c4Nm93OEdxZDRGV0sr?=
 =?utf-8?B?cFNQQXBJN252dUdCYmhrcWtTMVRLanhWeWIyZHFYOFZ5TTIrQzlUSytqRlhR?=
 =?utf-8?B?NS9GazBZOHVyTTJ1VjFjZm5tN2NJNE5Sc212bGR0ZG10cjMwZmp1RkpQWStF?=
 =?utf-8?B?WmppMXBWT013bEt3bmNoVWxFWGtYb1AvenZKZVNnaWxIbkpyNE1uS1F5SGJO?=
 =?utf-8?B?NU9vci9OSmxFY0xvU0NQU1hhRm5NVTR3ZWVZSW96T2xBN0F4dXgvZE5hR29h?=
 =?utf-8?B?cmVlTCtOQVduTmsvUXlFUXFidklteVdmQkFSdGtQR0wybFhFdTAxVzVwdFZQ?=
 =?utf-8?B?WE10ZWt6WG1OSEQ0b2RwR2ZvYllxSWh2dktPOXpqR2RZdFZVOWlmZGRqdVl0?=
 =?utf-8?B?K2hpY0twa1RmV0o4NUFOQkYwZE5vRlVVOXZ3ZEF4ZWxmdFpReFJqOElhNkpm?=
 =?utf-8?B?ckh3cEdlTFFLcFJaMklsVnU2NlpUdktMdngvSUNROG5QM0lGZjNIWmJ6ejBn?=
 =?utf-8?B?RXFZVDh3amo4cmR6S0N0dmNTNzg3QXkxUW5xSjgvMjZCTXQ1MEZCdFc0dWM4?=
 =?utf-8?B?bFBybGhFNVY3K3I5aDRhM2NBdy9HQXZpNDJGRU02TWNlOEdKbFkzMG1vaDc1?=
 =?utf-8?B?ZmJBSStTK2NUT1EzdzEweFZjMlNsUkMyMU1hdVVXUEFJOXZTL0czdDdhM2VO?=
 =?utf-8?B?RFBBeUliMHI5WGRKZ1NsL0JQQk9INjEyYnZ4NTkyejJkUUtHK3N4UEtQVlpi?=
 =?utf-8?B?dHNGdEZucFgvY2lDRGd0ellOVXV0UDEwQjR2dGNZSWJKQ0g4elZxK2c0eXp0?=
 =?utf-8?B?UERyVlRJWVh5TVhrOFRmSWZlYnR5aC81aUJUaHN0Skd0b1BHMXBITThnQ2kw?=
 =?utf-8?B?bUd5ZUZZODUycHhuY1NvQVVEYlc4RkhBSEl0UTdsd3QrWHJoL1dyZ1Z2eGR2?=
 =?utf-8?B?VG15Wit3cjJjMWx2S2x1L2FyU0pDNEEyU2U0UUNoTXdKNDBoNTNOWDdIckZI?=
 =?utf-8?B?TzYxNzNlSUd0NnliYUk4bkZUejIvSVFsY1NoSVFrV0FweC9mN0lENFZsNDVT?=
 =?utf-8?B?djFROXpDVzZhVW1zM24zd1RIOGtsY0hJa3FQYXp2c3cyUnNoYXoralpDM21T?=
 =?utf-8?B?Vk5UM01RVWYyUVpRMEpTN2RiTWYrTjM2d1JJUzBrYW9TOUxERzFiL1ZYbm5B?=
 =?utf-8?B?d3p4MDRDcHNTZldUeWNWSzVKRzh4UWxlN3JjQWorRFM2blQwMTFzYXJBY3RH?=
 =?utf-8?B?TWVuUlJMNTVWRlg5SGpjV1VwMFJTcUxkVVZDK1dwWmhHcE5POVdveElCdS9o?=
 =?utf-8?B?SDg5U1A2TnI0WStiOFVnM1pFcjZvQTRDNHB5TWY2QnJPaFdwcXhJTU80VWcz?=
 =?utf-8?B?TGVicFZTaTNTdUN0T0JUTFp1YThLcUVBRGppK0hpeVhnVlBtRElxemdWRUZo?=
 =?utf-8?B?MkVFZU5TeUN0U1pUWWhHUVV0SlNOYWp5b3ljT1RWUDlWVmtFYjNFMTNMNnkv?=
 =?utf-8?B?QkF5MmcyTlZkcy83ZHNxSHQrbXdCMXptd1RibVprRnVabW5zbHYzYlgySTVa?=
 =?utf-8?B?bTdLMkhWbG5sQ21PNWpKYzJmQWNDeVpQYWc0YWt3VDFSdEtLdEZOaXF1Qmsx?=
 =?utf-8?B?ZGg0QjZqOUZVaVdEc2dxalhkNXFEcFY4RXhXaTltSmdZNDBoNnUwSFR0MFVp?=
 =?utf-8?B?aFpqYzdCYUM3eDZBRG9haDhPWmIxOUUyRUlJTXRuL1dVL3VPeDZaNUd4NXFz?=
 =?utf-8?B?K1B4YzYvSm9MWDh4TVFZb0R4dXhZZmc2Tyt4Y0J1OUYvdFp1YzJmSHJiMncy?=
 =?utf-8?B?T05zM1JKNENCTGFDVjVqMU11eFRVK2M0N0N0eDc5L08xV3c4NW9vV2dzcmRL?=
 =?utf-8?B?QUJ0R1A0Q2Nkbm43c05MZnFXNkkrMk1uQTZJNHhhUExHU1hIU0hkMXM2Y2dO?=
 =?utf-8?B?bGFFdksxRU1jampCOFR0eEh5M2JuTjFldEErdkdNN0RkbEhrMmY0ekEwZWw0?=
 =?utf-8?B?OHBtVUM1Q2dkUlI2S3pBT1hpMGJkMTJFejBQWDBVRE9iTVhrUzZyc1NZNG9v?=
 =?utf-8?Q?daIA9+BVFA9yyZFaFFdlbj8=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 50458981-ae9f-4c9b-bb1f-08de38b0be25
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 12:28:09.0254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXVD640KdrvSfie/igJxo1YgcF20CHYGLiKKNexfNU2kcdllnsXWs4yQrzsdJLCBQZp7zWGdhgzgc7zRXuke4twMaeBuhsps8Y21+jGEuFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10867
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 12:28:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8253

Hi Antonin,

On 12/11/25 10:06 AM, Antonin Godard via lists.yoctoproject.org wrote:
> On some versions of rsvg-convert, capitalized formats are unknown.
> 
> For example on CentOS Stream 9:
> 
>    $ rsvg-convert --format=Png --output=ref-manual/svg/releases.png ref-manual/svg/releases.svg
>    Unknown output format.
> 
> While the same command with "png" runs fine.
> 
> On Ubuntu 22.04, both are accepted.
> 
> Switch to the un-capitalized options, compatible with all versions.
> 

I already gave my R-B in v1 (albeit in the middle of some text and 
rambling :) ), so missing here:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

