Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916A1CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:21:41 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.22])
 by mx.groups.io with SMTP id smtpd.web10.14026.1761319291200671153
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JMaF23XL;
 spf=pass (domain: cherry.de, ip: 40.107.159.22, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hsti07WfmZLwj32ZYstxb8HrVBuhXw7Ui/F87tFncziDCnAda9ptKOxWg7l021PbggoNGTZnzoTIsjEvJXwHr3VABnRP6GXDlFcM2Hcb8LNLLmxjz9fpli3fe+huu7B01gJhIUiWltVswAQUtJKu7K+St9RuXQYhOHvM6EHA4hSIOPjkOhe8xzsuG+p4T3Px0ZJWtYpVIB03h1jteYy+WMBGDC6fLGEXeWeccfbWw/v3wrMfk9uA6mhZRRPO1gWj4eG0nWheHlYtSm9kkdfPIcQDF3Hzcvj5M1E6/zg7/rMlKzm+JZUgKlFPFHmQhxe0Bx5vXa/wmN2nlq6ZbKk63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/9VAFELumaYqCQwTaDKwX31VNFA3Y/Rcuh/UucQE/4=;
 b=aL2MvdnGaAyOAXjQ8xqcWjj7Q7Np9NLjoJY2swmRYI4s0JhlSP+lkZdRxFrX2TPDWV9IPLfaT4hvZT19+y+M96TVAE7PVFz3hLQZvVfHkp/6BzPlPZtEE9IzHB7neRHgfAuQ4t502kgc2mTMawyqRWD+KxUveioHBCWxgjs4S4AHcR4Z14Iln0eu+cj+aqv1uhgiBQDWnSfB4m6hfxGoisx6J7jmtggskaf3X2Vnk+0cXjipB+GZsEoEwt99erbFTMRKapyOvbyC2ykQjTWucjLOSArlLkB9FesJ6K+ZWVrepktxUDEQFcYQyl6MYdZRyadButG7vIG5vd8ulJkJPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/9VAFELumaYqCQwTaDKwX31VNFA3Y/Rcuh/UucQE/4=;
 b=JMaF23XLaHSkWLWDqIKJSWYDhVI9I+b640bZxjfsquhV1EGpMh7jtPZxbrqY6HRa2T7i3TQ7bWlh2HbfkU4Nx5OuxhcXHpM38q3LH+gUb2PKoIDMgYQ6RW0MG1yizlXik3ZShb0em5HaIKqWbU/XQI9p/gmlBeF7zpDL4Gz5iLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9218.eurprd04.prod.outlook.com (2603:10a6:102:221::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Fri, 24 Oct
 2025 15:21:28 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:21:28 +0000
Message-ID: <9e112711-7e8d-4512-93fc-28a12e97f2a8@cherry.de>
Date: Fri, 24 Oct 2025 17:21:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 06/16] ref-manual/variables.rst: document the
 REQUIRED_TUNE_FEATURES variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-6-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-6-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3a029c-1ee5-4447-f7da-08de131100a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SStUakRJZk0rdXpuczI1WEJVNDZaZEFpYTVYc0N3NHhZa0JSYW1LZEdhMHBD?=
 =?utf-8?B?blhNYWNGdURoMm1SVDY5SUFTdG80bUx1a3VnaHFrV3YwYXZrdE81TzZtVmZy?=
 =?utf-8?B?V3VMVEJHbnBPZUxWY0dBWGlFaVBXQUFXdkJ1RDhvVisvVVpYK3d2ckdneWVm?=
 =?utf-8?B?Uks1RmNDVmhNT0JZc0MrRnk1WlVTTkNxUU9oZVNEUlJlbVc3NHNmc2psT2xx?=
 =?utf-8?B?Y1dFVmoxTEs3TjVSSEs2MTV6Zm43Y2I1d2pRbU5qdGtRV0xRQ2NtM1p6bkdH?=
 =?utf-8?B?bWczcFFWbU9veWpjaWF5MFRoSVpXUGhCMEh4blVVd0NOODZDTE15QURSVWdH?=
 =?utf-8?B?NElRVWo2L1FvQ1hGNlo5d1g3dnlTK1RlRWpPTVpuZkdIM1k2amFhcTNDTFho?=
 =?utf-8?B?cXBhSit2dVRVc2VSMUZUa1NybloyUFRoUDNJc205WXl5VTViMmcvN1BVS3lp?=
 =?utf-8?B?OVVXNDNnbUlEWTlZdzB0T1lEd3lYZnQwV2ZweVF5R0w3WlN1UnVFYWRBeStr?=
 =?utf-8?B?RllOSHpvQnE1RldPcVdhSC9KWWJjeTFDTjhVZ1pXT1Z3a2pPNWxrU3dzS21C?=
 =?utf-8?B?a0NtSnRERXF5R1NUbE5HMEw1ODlCeHZ3d1ljWExiekozTlVaSWh6cmMyR0hT?=
 =?utf-8?B?dTVveW5nWmhRaXZtWnY0OC9BRkFKaSt3OVk1R1psd1h5VU9Cd2F6Ym81UzYz?=
 =?utf-8?B?bkJZQTZieVpjSUlrRVNDampyVkVyMUxsYTZNbXhqSTlWRzdVNVRGZkxYYjBU?=
 =?utf-8?B?VVNoRzRHUTVFUTV1cERMN1UwTklyQkJXakVRZ1diZFJzQjFLTldXSXJ0ZEgx?=
 =?utf-8?B?WHEzQ3Z4d25VME43OURRYzgzWUpaKy90eXlrQVFjTVZNWlNRcnRjUkdMcXVI?=
 =?utf-8?B?eHRVM3pNOCtrdUhxYytwSWJCdTZNRmlaMkJ4M0JuZjFFeEpmSlBXM0Y0QTR0?=
 =?utf-8?B?SGFITm5XZnlVaUZoZTM2REtVaDA2ZXFBQStrdkdtcjlRUUVTYUVPdnc2VmhK?=
 =?utf-8?B?aHNQTVB2TUhkT1ZIcG9qQ0R6SjNIZnFLWUNlbUlQVmVuak9LSlV5N0NNMjdi?=
 =?utf-8?B?dGJ2Qi9BQnFNeTZhcFJTTFVzMEVTRzl4ci9iQXlFbjZaUzVydW9mVnUzRm8z?=
 =?utf-8?B?cXBHTlkrK0piSlpxNjdhOXZtUDFaaTluN01MVDFoUi9WdkFpTFRrS29SemVW?=
 =?utf-8?B?UmsyNW9HT3crREswSGZVUkZDbTlNOHFpZm9YaVVzdTViMXo4MlRjLzVoRHgx?=
 =?utf-8?B?U2tlWVlrUFBxOFBzYzdqdFpmMmF5NkIvUTdxOUZCc0FxZTR3b2k0dkUwVHJ2?=
 =?utf-8?B?U3dRdG5SN3RCbW9FSW1mY3hKWitXTnBmODZQTUFkaUxUeUkvSVd6WUV3Q3Nh?=
 =?utf-8?B?MHRXdWlNMno4eHRBbkFQV3FGY09VdVJtUnpGM0lHZ1ZxRHFPV21jQ2pYUHZm?=
 =?utf-8?B?a3AvTWVXc3hlYmVCUitEdUVqUXdKYU5lVDRRWmtZVndCdmZWMDB4dDBWTDNQ?=
 =?utf-8?B?SklrLzFkSExyV3NFSDBqZGlXWnF3YmpmbjNCNzM0dzZGNUpUbW1HbXo2M2Ro?=
 =?utf-8?B?Qi8wZHVlZTMwZG8xVHp4YWl1QStSRENDWkEvbGRLaU9mNFVHdU1QVUpvU1dV?=
 =?utf-8?B?dEZZdEhQVVlZdkd3WVJ4TjhnZ1Y3S1l0VHpubE5xV1F2YzN4U3VTNkxaU1BY?=
 =?utf-8?B?U2JqWG1HeXlibHJoYjF2VGtMR0R4Y1lKcnR3RU9ZVldrSU9jQWdxV0FyZ0l6?=
 =?utf-8?B?ano0aWhhV2xwWGZGTEcrNW95VjFKdUlMOWQ5VFRiK2JPUCsrVkRiaWRQdnJJ?=
 =?utf-8?B?bTF0ZmNiYnY5WFhCc1NielJ3YTl0N0VLSithaGFwOTkvWUsvWEJzZGdmME1M?=
 =?utf-8?B?Mm43bk01aVNST24wUndHVHllb0ZKL21sVzZyeXEwYnd0WDllNFlrdlA3cnNP?=
 =?utf-8?Q?1KITsGAnUe8cpsVkMnzcq3b2gKhZtjeQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkxDb1Zha2JQVHoyci9pWmt2TWsrTmlJQWZITVhvSkUwMHdLcW54aDNNdDUr?=
 =?utf-8?B?amNOSDdOODg2S0I0WUg4WWs5UHBJU21Gd01SdHJjNDNKa0MrR2Z6bEI0QU5U?=
 =?utf-8?B?NS9DcFFCMVMxMHIrRjhpSi9Cai9tdVJVelZ4RmkxSkxrUTJneEtoMExYd3du?=
 =?utf-8?B?MzRzMlFWejRNS2QrcDd5bVVqa1p5WktueURuQm0rcCt4T2VBZ092cUcvVEE4?=
 =?utf-8?B?U0c5dHpLdUZaSmJsUzIrRjErQ1pQZzNnNElOVmNJbmNxa3Nxc05mMzUyZjBm?=
 =?utf-8?B?cDlTYjAzd3ZxcEI5UWZ6ZHlLdE4wNEJDTktmVGN4azBCb3dIMDZJNEdZcnpQ?=
 =?utf-8?B?Y3NMT3E1ZFlvWVlQS3RYSUNBMXRvYjRxeFZMOUQ1VzRiMU4zbHRNdk1UZS92?=
 =?utf-8?B?ZUw2a2NCdWtMb1ZkUzZQRkJMOXUwUkNlbktJc0VLbzhVdmV5UVpmRVp2U1lB?=
 =?utf-8?B?N3E2SWlINDkzYTZBaVRVT3M1M0F0ZlNEZ3UzZk9ndWxBT3E2RVRWTW0xZ0ZH?=
 =?utf-8?B?YzA1UjJrZEhMMEdYV0VKVkFwSVkyM3VvL2dPY0x2bndIZkc3Uzcza05UbUlK?=
 =?utf-8?B?bXpkM2ZLaTJWRC9LR0pWY29IK3JPdmYrUEVlV3RFa3pzZzRseU9laGJzaHVD?=
 =?utf-8?B?NnRGdElqaWJoZWplQmo3YVJYUDBFYUh1c1lBK0xrZkU4Slpxd1hneVEvSko4?=
 =?utf-8?B?eGR6ZElXdS9qbjlUYmVHV1B0WWJ0UUN5MzlBS1c2WlJJTk9wdWRGSG1OeWh3?=
 =?utf-8?B?TXVmbkhacDN6S0FicW4rbnd4VzQ4SkxHU0Fja2ZCRTROZWtQV2p1SzdSMTlt?=
 =?utf-8?B?S2psOFVrZ2tlRzZSNmlvNlRnWU8yVUpOYnhNejJDSTlMMmh6NHJMTWVvcUtJ?=
 =?utf-8?B?VEhQaUp3c3g5bU5Cc2NESFNlbGVRa1Y2SDJmcFZud1REa1VIai9uRXFTM3FB?=
 =?utf-8?B?R1VZU1Zod0RlTC9WMlZKaXorVTZLKytnYnptRk1sUE1acEJpMVh1eGdhVHZ3?=
 =?utf-8?B?YkptcjJEMXJHbHV0dm4rOWNNWkQ3ZVZaemlvT0l3L3E0czFxWS9CRFpkYVNJ?=
 =?utf-8?B?OEw3cFNDR2IwMGljQy9rcnRpcHJIcEMzcmRUaHdwTGliY243elVGbUg1Y3Za?=
 =?utf-8?B?dmU4NjNOVVdieWRFdU1UKzNSeEFCYzVySkxkVHhxTXkrWkN1YjdkOU80Yktl?=
 =?utf-8?B?OE8xcFk0Q1ZhbmE5SG45Z2lELzdXM0NJYkFqQzF0QXRGTE9pVEVmU0krbDZp?=
 =?utf-8?B?RjdIOEg2SlltZnVnN1hlay9wK05ZY1lMV2dac2Z3aEo1L0xGVUZ5bTh3NnJl?=
 =?utf-8?B?cFp3Z1FCSGMvR3NQc0RneXNCdkp4dVJ2TVQwOUN1U3BKVGJ3ekUza1BLbGtR?=
 =?utf-8?B?dWU0MlFob1g4WGkwMnQ3UDZ2L3ZZMkxNSXhWd2JlRUpobGZ5STEwSXMzMDRP?=
 =?utf-8?B?SC9vT3BsQVFLNjZIYVhYemNLdUZPMUhPaVZjLzk2Q1R1ekEzeXhtVnY0WFk1?=
 =?utf-8?B?UjV3ZmtSczRqU29ZZmVFMXRvQTIwVW9EWklDTExMSktIb3QxK2IvTk5Bc0My?=
 =?utf-8?B?KzZ2cTFQKzhudnY4dmg1bmNpQUd6RHJvczJRZlJtMGowWWNNZkFRcUdoT2Va?=
 =?utf-8?B?MldZcU01SzdSS2RzSmFCK2NDTitWV1FWSm1JUjByaU5pOFZKQnJTVC9RY09W?=
 =?utf-8?B?S1NvMStoQzk0M0NvSmptNm1uc2tJQ1lHM0NZTjBOVVZpM3QxYUFLdW9Kc2Jh?=
 =?utf-8?B?eWtGSWYxTFR4VCs1SXFnTXJHRExkZVRiaXJIQWVxK01qTkQzVlpnS0syMm10?=
 =?utf-8?B?V1hxdGlPSUpyM2N4M2JrRGNJUjQrVTBwcHd4RlNwdCs2OXZXNmx6OGVLUXo1?=
 =?utf-8?B?T2tKRXVEdXVDd3RpSGNIY2JVS3NRSU9jc1JESmNxZGdYN1l5a1A2UUNMcHhr?=
 =?utf-8?B?WHRWbVJBVExydXM4RjVkUExvaExLa2pVdkxxOENSRS9POHlrUTRsWFFraEJ6?=
 =?utf-8?B?Q01aQm9YNGh4U0lLTWJHQUlQdjhXOVU0NmFjNDBUR0dqeDl1Y2tiMlhzNitp?=
 =?utf-8?B?VlBQVUhCLzlDQTZiTStGUFZVVlVHc1JaMFYwQ2xJcDFvbW9YV2kwQmd1bkpG?=
 =?utf-8?B?U0xkVjYwd1gxVG44NkdZdDhMbzd0N0tEZDdJT0JseEFjTXpaMXlYYXhYMXR2?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3a029c-1ee5-4447-f7da-08de131100a8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:21:28.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQnkk0yMjGcAz+H11PwJogDtShjK7sJkISOlQuMHfmZJUVwjsqFjmSVRCZKXUpctZf3moWSnA+AMa72ODGeDYiddVzZxaYicODsgZ5HmnsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9218
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:21:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7828

Hi Antonin,

On 10/24/25 10:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Very similar to REQUIRED_DISTRO_FEATURES, added by commit a8ef7339ecb9
> ("features_check.bbclass: Add support for required TUNE_FEATURES") in
> OE-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

