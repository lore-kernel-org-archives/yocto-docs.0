Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DF8FD5327
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 09:53:00 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91861.1772185971447799189
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 01:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=CoReXq2g;
 spf=pass (domain: cherry.de, ip: 52.101.84.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s75viA/WLzlLLZiQD06WgolZkdgpvUrJxAKnMNx9hvYCpd5dGX4WMNfJ93DG7yg+BNn9p4UIeUSWi6bLyeSG9n6a34KWTdpjMBq9t58zBGBmpAXwar3PMAYa1VMZeq3uBfF1x128AwWtMPTW9TDQiM9a5eagJDLKugBFN2VHxtBDmSQ/cv5MO6pZQo/G3aPLEXrUMQdl24NFY4BsmSgTCu60E+jEgWvQ8jekU1jwvrqIpB2NDiO3U829oEbCsuHVunwTlKEGMWuh/E0AvmHVpK5GcRECObnyMv6pK06K6oDi+7+g9PXG0k8J1lz11PHW+2x6Jen29K8laCTmkIZwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+rl4ncba8F1ZvT8zzocOzRcoaTIEwTR8Qpm8lnEiGU=;
 b=TACCHUpQWDj1QeupeA4VZuvuxO86+OXBoMGmRfSbH3j8h3M1ZthW2npddEtJpWxt7vb5jY/fKtxN7bWrFvp48h39PnbqvJ/2zSw4SPVVYNNDGPlFihF8StF++dSGGwMkFCxkEmwTBm379g6CUub+XDGu7j4NCSjgdgnUwJSI5Yy54yaTaW4+0v4XTGZI2JeTSeurfnLOrSwlJGqOEOlu1Ht6kHO7xSHDh5MZlcuwgC0schC0Msvd/u6GnCr2Vb1A8pLav3eOYUj5WQGfULKCi3/86sw8fcTSNAu02Qvi8/1ReG25I32kPOxRsrjo/GawcEbUvo3EBKUPKEiX4CHQ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+rl4ncba8F1ZvT8zzocOzRcoaTIEwTR8Qpm8lnEiGU=;
 b=CoReXq2gpBUksxByGtnwgEPYrGBPxDiKZKvYbZPuj931s6kwSCDRTmGlIVKWWsTnv16REMdqn1fUO78wVNRramLnSga6LJoVTrw9fYCMtsX6Q6ARNuP+S1aJTor/FD75h7RnCS8ufoDuUAILEgmemD1OyvLKMRAzkm0BUBEhBB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB8330.eurprd04.prod.outlook.com (2603:10a6:10:241::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 09:52:46 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%5]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 09:52:46 +0000
Message-ID: <1d1d26aa-d5d8-4e11-bb41-580de94d9d82@cherry.de>
Date: Fri, 27 Feb 2026 10:52:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/containerfiles: fix docker warning
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260227-fix-docker-build-warning-v1-1-5557689ebc3e@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260227-fix-docker-build-warning-v1-1-5557689ebc3e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0299.eurprd07.prod.outlook.com
 (2603:10a6:800:130::27) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 414706ea-a49b-4d2c-9d7c-08de75e5f560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	Z4xUO1yQZGjw5jOTcR0BwLCJggl2OZhu/qhzOGWyj6Xh6LDlT7rqgRdXFWeBWrr+K8kHVWMDTjBjVohTLS7Z8IbqLTLWnBverNgf9rs138vR68Z/WS+reb8chLERXFA4jwb+cxY5aOGbqf0+X+vNHHJmiWLv9VpdWtGBlFDNRj1tzHzOLTRno5QXY+6h52nHbmNn5dDyd0I76aZkGR4OQiMrOm9e0mVR/9wTi3h/2hFBQCPWalS/vfwy39elz123liGPZGoEmUY5VDVb/lH/T4sPnX1bCkYjrswrZBmiXJaoH61FO4pD0mnSB1nZg2soIYqUmzcWHTgh0o2Jhr1kLfusexVCxtkvIkrGDSoQRdglDF2k1s/8x0jr4y3LNKI209+/bDeotiRGHiRfK/80C+D5v/JpkafYHd8Qnwg+7eBkYYYGTcLBwW4T4Uvimys+xoBwjCPCT1xhNRwwsRZ7xLZINkJ90Jq4Ku6uuS3Tu+wTf/6P4soqWe1V4/MOT9T0IbDbJtzlcq3rGacZVHQHMZA/yb0RqrlSgMEuOqr3Oe4qa8VrMiZGw1h9ZDW1m89cBOk1ktEzOWnqXkwnuHH6ajhzrMs5VPeMFgVwJjn+NVPp/ooSVereRiL0YXhHQ044av3DUwM4fDX6uB5SZbhwlkRVMshGLX3Goi3oMGeQYl8h04LAwjs7wN3PCcsJXO+AgZt1sMK2pBAZs+e/1rRD/2o9DQNlSC64EJu9FwdeBqE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y1hHcUlTa0E1cUp2aVVmeHJxdmppSnJBdkJTbWY5eU1CU3hMK1pneW42SFEz?=
 =?utf-8?B?eW9wSCtPb3BKY0JnT1o0dDZsbnZSditvQUxtaGxxb25ZaTJGc1FWVVJkNjBY?=
 =?utf-8?B?eHd2TU1yU3BHNVIvcXR1TkR4R21iMllmam42enhOTVE5MTZ1WkNTOENsWXZ4?=
 =?utf-8?B?dk05QWFQczVsbmlOV3dsc1ZaQld6U2JpM3JBY1Y1V0lZVXp2R1dlS3M0aWVQ?=
 =?utf-8?B?ZiswWEtIcVZwdkxhWEFKUU9zRFMzcUYyWHZXdDZiTksxbS9Wbi81M080RUM4?=
 =?utf-8?B?TjNRajVHcFVSRGY4KzlWaUszbHV3Zi9BaldYTEp4SDJRZjQyT0lOZHpYclJR?=
 =?utf-8?B?UGp5U05PR2M1SmQzallSWS9FczhkUkZnYzM4R0pQRDI2dTN5bHRkYWhoMTFF?=
 =?utf-8?B?Zy9lNmpSWUd3aG5EeW92MzM3cXJoK2hIeVUzVTVIa0kwK016bkdiVzFvK0ND?=
 =?utf-8?B?RDBkNmM0TlMxRHlFQ0dvOGRSL3BqNEU3aGhxMkpORmxtZ1l3ZUwzei9CZHZy?=
 =?utf-8?B?YW8vVzJlbVJOYlJrRE0xVzlHNWVWNk5kMUw2MUlnYUUvSWpRamFEWFNIKzgy?=
 =?utf-8?B?eVZVTndzMjBMOCsrTEFSNEVXS1Y4d0c3dzc5Z3JaVDB1QTZtNm5ERjlJcTZu?=
 =?utf-8?B?NURyUTFhUUZZR0dqUW1NSm52YUlGRWVTTzNqOGJ1STVFQ0ZYTEc0dU1hTGw0?=
 =?utf-8?B?ekxiZEM1Q2tJZDhuTURXb3ZpVmc0d05oTHV1UUZGYnZlM2NtVXN1d2xzcGla?=
 =?utf-8?B?YXJTa25UZ3NoallQZ2VUYUpyZkZGZm1EV0lxbzA5MVF5WjF6YUlsOE5tQndl?=
 =?utf-8?B?UUZxY1V1Q1V5SHF2Y2hpU1pkS0JHVU03NzBBd1dYMmgybnlBTjZtOHNaeklM?=
 =?utf-8?B?Vnlnd0ZpRlBiNG11OFFkSlJ5QUdiK1dySDJxbm1UcnYwcVlaRWg5MEUzTjlZ?=
 =?utf-8?B?UU1kTDhjUVN3c0pUTVVvS1VqQXdCRGxPRnZ5VzVqai9tdFlOVk1mcnBLaUdN?=
 =?utf-8?B?WC9nQSt3UFJqQzJpV1FyRnlIMlpUTGY5WjAvcjRGa1VBNVk3SkFqTFRjTWRt?=
 =?utf-8?B?dTI3QTN4YlcrSCtEWGgyM0U4enk1TUF4bTI0UUNUOVlYWHllSUxneitTR3l4?=
 =?utf-8?B?cTk3SDQ2Zy9ReFJKemZNZU9YUS9Xbm9zbWZRMmxYcXcvS0l5SjJFdEhiRnNw?=
 =?utf-8?B?bHcrQ00vT2xVRi9IQ2p4eVlkeitXY3R3R0k3RE9Lai9Qa3NnMHN3aitxZERx?=
 =?utf-8?B?bW43UkE2SFhnOG05dHhLeUxuVytxV0h2N1hrR2ZQd2h3U25VMkFEWkd0SHE0?=
 =?utf-8?B?NWFEL0NYV0lFRUtlUDdLT1ZHVlZXQjBySnYyd1pBdUVXUDNTMlR2UldFUEVY?=
 =?utf-8?B?cWduQU01ZDVyd1h2RDJHWDY4Z3BjTmU0d0FXeVBtMEc4Zk00U3FCOWJ3RWVK?=
 =?utf-8?B?SXhKVzRXbS9KS2h0WkJ5L1Uwejk0SVg5U1hOZDRjYitNUldtVFRYS3hyZEp6?=
 =?utf-8?B?TjZHdUwwOENCY091dGhDT0IzVmRBV1o4RnQwL2RlTzlBWG1TTTdDcVNYV05P?=
 =?utf-8?B?a0c4OXNKY1BWSGgzSkNiQzlOV2RrUTREdjJROEh4cWhqbmFiRHV0RGlmdFpU?=
 =?utf-8?B?aFFJNHdaQnoyVjNlcGpkcUlBZ1NtYlVkZ3NqaDJvTmJwcUNyTHE5c3JvYjhp?=
 =?utf-8?B?TW9pYmRNS2ZEZ1gxUHUvcjJqcmpxQWRzQVhMdVVZcjJnQS9jZU5abTR3Vlg2?=
 =?utf-8?B?bXRwQk9neWpCd2F6bkR1eVBoVURLMDd4c1FOcHUwbyt0ZXFMRy9VUGR0bTFD?=
 =?utf-8?B?Z3J6U2QrWWhXamNCbFg2VGdOb04rVmkyaHhveWlmbHBYaG0rY1JpYXB6eENM?=
 =?utf-8?B?N1lvMGdZcGVGdE92NFhQR2pXOWc0MXFwSWZxRU9Gdkk4K2V0ckNCcmpzREo0?=
 =?utf-8?B?ZHNBcXdGdXBoQXJXTXFybEdOUFV2WXBSenppTkVhY2dBOURudmw3NGU3RTds?=
 =?utf-8?B?QnNvYkwvazZKTy9tRkwxc0FWWklOaXl3RTNNUExzWTRPSkdNSlQreHoxS0N3?=
 =?utf-8?B?OGRhSjZkcEM1em9USDF6cEF4R3pBVkNPK3dJMi9GcDA4c3VPRkpoYUEzOGxs?=
 =?utf-8?B?QmNzb2lKUkwyTE5JVVBmbVovZzd1UUdMd0gwTGZlcGFLTXQ3My80Vmk1WVY4?=
 =?utf-8?B?VTd5Qm5hVXd2YWxIN0RJRWQ1RmlFeEhuUEcrbUcvVS9PWXgwdmlFTExJMWNX?=
 =?utf-8?B?cnEvYjc2a0M2ZzRnZGFaYXVVLzhsZmZzc3REODMzQmtvTnA3bU9zeCtmQjlp?=
 =?utf-8?B?S3dqK3p2MHowRHFUb0VtUzNqbFo2QTBqZnF0VUVocksvUENnRUQxdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 414706ea-a49b-4d2c-9d7c-08de75e5f560
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 09:52:45.9787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YPN49vCQ3oT9Cy43vWG0HLRSM8ZmatfZvHYMLrUV1HKuKSzl1Bo4vLpuT5RuCq5MZXnik87rro/WmfDdMXQNZMfD8qifzu6U9wSaIIVITE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8330
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 09:53:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9002

Hi Antonin,

On 2/27/26 9:55 AM, Antonin Godard wrote:
> The current Containerfiles produce the following warning with docker:
> 
>    1 warning found (use docker --debug to expand):
>    - UndefinedVar: Usage of undefined variable '$PWD' (line 12)
> 
> Remove $PWD and set the WORKDIR so that our pip3_docs.sh script finds
> the virtual env.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

