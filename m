Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DEDC021AA
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 12:13:29 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.77])
 by mx.groups.io with SMTP id smtpd.web11.49742.1739794407674689459
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 04:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bja1wn7/;
 spf=pass (domain: cherry.de, ip: 40.107.241.77, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oisX1ITb1++J2pji82efobjIju+IR6eBcuQCZGfXfEo7B0NBUplfepNPCjUN0yvL8qvOdf/ZNYCHjtZ0lYgUF2GSiZjxTaNIOegFy1HUjAt2NRIeEfhv/uDuL6gg4a4WIp1x1J7eXYTWarAA0TKjCZHFq78hhqm9rj3qNniq33rNCvdeXxNc50MzIRjB8WNAq27IWDEr9BFai1RX+kg4KkJyjIqtjFmS1iLGVCKRWhd+WEf4iaj82WbP68Bj+sDVYZFOxxeY4MTv1Ld/fmm3f6BDPp/FvOxHxVXWuhRSagsT+qRRcDUivXIAr90S9eECdprKFeHMmbLq0AU4FPHQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etWZAuKe0igMVUJt5IxzC1JKis+Cl3vuUdxaSXUeak8=;
 b=GfKJbatEpOScmkVlbkED2Vx0XYY5N7v2JtaMsmmsttzeiaqUNzfwvftMd4Q5pbkeG+cNm9VSnWhqnW0bEJMwbR39TxJqsrerRxCBUI7S+jAB+2j4/NIlyzE4kL4MnsJQBYGWd9UTebKhGk+4DZWT8Vqumqwl0rdubgnoFY55jQOrRskrsd3Qvyxyy1gUqOjnPEciTCosD3lYogDcD05Zt2mT4Gqz+eKImVlJxYGOKPRIf3YfC1UaEykE//AZC506Y5YBPQ4/CYjykLjqgBL6te544cauhQLGPwWxnLiDuGTVtiEceSvhduIY5soZKulsrLWpizKB32ql4wWSzF07UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etWZAuKe0igMVUJt5IxzC1JKis+Cl3vuUdxaSXUeak8=;
 b=bja1wn7/bM4g4fz7K5JXrtCQwBSvZyvGxJyncnRm8PElvUbhKDmxRfOHO2UslOzpr1feULFhO67irjymVoJli4l7DN/6uJk/ACp9FuqMI2ukGGLzn4ta6/Xzsm0C8fyxH3KUOpF2PmDSGjH0g2Rv6pimPwHUPTEWEXc/fgz8ZIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB11031.eurprd04.prod.outlook.com (2603:10a6:10:592::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 12:13:22 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 12:13:22 +0000
Message-ID: <028cfe36-ef9b-43cf-a58b-6485593fc6fc@cherry.de>
Date: Mon, 17 Feb 2025 13:13:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/6] migration-5.2: fix references to
 BB_CURRENT_MC
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
 <20250213-multiconfig-doc-v2-3-f2bd35115cb7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250213-multiconfig-doc-v2-3-f2bd35115cb7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB11031:EE_
X-MS-Office365-Filtering-Correlation-Id: 3044933f-198e-4d1f-31b2-08dd4f4c78c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3dpOXoxM05JbURTR3dNM0xkWkMzOFVMTkVqNU1ZQVVzVEZZVGlqTmZnTXY3?=
 =?utf-8?B?UGU4T3l4bkU0VitlNVNzWTRVYUoyV1Y3eFZRNW1uWmhrSnRvYjVmV2NudlRC?=
 =?utf-8?B?UTM3NUFMMXU4MWhkN1FaVGllYmtaS0h1VVJBWEhyck5UVzBLK0JhajI5bHFs?=
 =?utf-8?B?Y203T1VuRG41QUV1UFV2QzJNeTVBRzZ6bERrdDA0b283QWdUc29ZK3ZEV3ZX?=
 =?utf-8?B?QjBTL2hmYWJhK2NicnZuQVdsMUF1UlN3cFpxRllVUkNlTHk4ZS92YWwwekpI?=
 =?utf-8?B?ZWo0WWRCeGd0OVhZUFpaM3hJZjRVbjF1TjhjZndVb0gwVDZnNTJ5Rk5HVzJy?=
 =?utf-8?B?a0R0bHExSFNLTk1sNExFRFU2elBMeEFpYkcxR29MemVyQ1RJdC83WVEyQ2Zp?=
 =?utf-8?B?aGlZVXFvZlZrQXJwT2dUb3ZSV2RmR2RhWkNVYlg1Q2g1WGdBNTBwczVZUENL?=
 =?utf-8?B?Y3k2U1A3ZGErMGd0WjhhU09MREN5VmJFK01EcVZJRUtjVDVrdUN2akN1OHJo?=
 =?utf-8?B?N0pwZHFUaEdRQ0twcHZSeGpMV2U5UWpGRys1QWs2VXFjY3h1TUdIMjhHQzdn?=
 =?utf-8?B?VjFWNHRlcU9nUGo3MFd0RlIwa1dvVFNLQWFsTWxWMmFXS3JUcDNDQWdFRWpj?=
 =?utf-8?B?Uk54alc0MFY5OHMweG5GWEEzdEtSQ0lpQktzNjVkNDF6MUVaUFZtRFRSNEZO?=
 =?utf-8?B?SVRCQTc4ZHFFcmxsRjB2RHVkNWZZRUEyaGF4NlJDVG1WVVVRZTNweU5sd1hM?=
 =?utf-8?B?SUgxVFgwZFI3K1VvdlJpZE94ZWhpd0NIM1NKTXQxcDNDS2tuT2h5VEJMMXR2?=
 =?utf-8?B?d3RWZXFQY3NHOEhRSnJIL254OHhSUExCMU8vRlhVdlVhWWN6cmw4N21IYXNw?=
 =?utf-8?B?MHVkc25VVkVRdGNDOEZyWklwMk4rKytNVTFiVFNON29adlRuYTBRUUNKemc4?=
 =?utf-8?B?RnRXZzI2UEYyZk1qbGpMeFlpK2hMWGJ4UFV6dTBMYjJTcHRjaGdoRmMyd2dn?=
 =?utf-8?B?c2hVQVNxOTRhV3VkRm83WXFtQXlnQ1FEUVAxQ2Vqbm1xRVZBZlhydmNLT2Z3?=
 =?utf-8?B?L2oxdGIxQWl4ZjBQWWNlQmhFb1ZOMVg4VXFTSjZRTW9oREdobXViaWZXWU1y?=
 =?utf-8?B?U0hFUFhVZ1JhMzQvdlNyVFgzajZtMUpMbC9rT2RHaUhucmROSEdWcktSNTdG?=
 =?utf-8?B?UXhJRTBLa0hjand3WE54Ym9qSGszRktKUHRENFRTOFNLbmpvbmJmeXk3bWJa?=
 =?utf-8?B?ZFBFRUswZG5tcU9rSk9HQVU2T3o4TnRibU5tSGM4L1FzdWVRcmNmTitob280?=
 =?utf-8?B?bTBYZVQ0MnN0QWI0VUR4dlhUTEpqWkRGMHRuRGZxbXl4eTZWUHBqNVc0eWNh?=
 =?utf-8?B?SVROenNNaGJLRXNDVTJuVXF3N0xITEY4dTltVWMrWldxZzhNYksxN0dRZ0ZZ?=
 =?utf-8?B?Q1N5R1NvNjRqVzFuVDljdXYzV3JEaUFRQ040ZTRvK1dvVWV2YUUyOHlaMjRH?=
 =?utf-8?B?akZ6aVBwNWNLRXoyZUVpU3lVOXdEV0p1U0JVUkpkUWRwR1VGVWNOcktWVnh1?=
 =?utf-8?B?K0pZcVZwWkhISDl2QmJXc2R1TS9mN01OTTE3LzlYdVA2b3A2NGFOOHdCRC8v?=
 =?utf-8?B?NnBnekhIOVlFUmYyS2JzYXRyS29KVHBDdTNxZFhIQk1Pd1hKTXZpOFVhZ0lm?=
 =?utf-8?B?NlhZSzBublEyWmtUQTlhTWFSdnZTQlBGMzZ4L2FiaXFyd0ZCc0FYcVB0V0pi?=
 =?utf-8?B?V291enJsaDAzWDVBT2xHVDN4RXEramFldUtiYXNWcmluREl2RHdJaWZTMGpw?=
 =?utf-8?B?KzlyWFZuNmNOeXQ3c2hCSnFJVTZiMUFzUFo1OURQMlNkd1dEQ29qc0RDQXNw?=
 =?utf-8?Q?qXyUsmomN+37i?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2hWTzlCRTBCcDNTTHB0VjZnakk0UExIbXlkZHJRc3MyL1hoWG5VVmpUcHlv?=
 =?utf-8?B?OHh6bFlEa2g3Y090ZHJuQU8wS2NTUFd4dWh3WCsra3ltT1pjZnRMQUlwN09o?=
 =?utf-8?B?ZUxWY05kdDNRc05Id1hCcTNtdGFrcGdEdjg4dUFhOVdOTldrV2xDK2c3THNL?=
 =?utf-8?B?R3VicmJyRENqcGVUNzhRQ1VRK3RvWCtmMVZqVDA0MWxNSTFhUmJVY0tQbE83?=
 =?utf-8?B?UVNVZWZWWlVvQTZSakR2Q2RkNWRrTm9OK01SWFk1ZzU4VEdrR1ZOdXFOY0NJ?=
 =?utf-8?B?enF0U0FTVlU5WFhhQjZPK1ZLTFpkWWNHOVNxZDhyNUlmanpTUmx1ZWlkV0xN?=
 =?utf-8?B?NGRXbEdiNEJxZkZyQ3dVTXZBWEMxSGtHdWRBUXltaDBSdlV3c05aQjR0V0o5?=
 =?utf-8?B?T05KSkdIdUoyWkFWNkRuUkdHOHMzMDJxTTUrdmgrMFdEYlVJbEpsWE1BNWJO?=
 =?utf-8?B?QjNIT2dvTFEvVWt6VVVKZlRVOVBVc1lJQmd4L1RIWFBuYkNZT1lyWFk1N1B3?=
 =?utf-8?B?UVlkOWsybGJyd0xYczd5bVh5dG52UUlUVURTanZQYlUwcCtCVU9ZN1k0V0Fo?=
 =?utf-8?B?bWd0UzNvR0EwenFYVGtGbmhqYi9CbFpmcS9WVWFjY1plRmcxakd2d2c1eTBt?=
 =?utf-8?B?anNFM0VVb3h0WWc1d2tWM1dXdTFyM3NyUFhLUWhUK2d3dnlJTEVYemVwQ3Ey?=
 =?utf-8?B?dHFrckRGZHR0bEFrLzVzZmxEZ3FjZmhjMmpFZjR3N2lEejBIVEpPbkxZamlS?=
 =?utf-8?B?MTZCcFhQYS95UE85UlAyMzhoZnovRENlbk4valN1N3Bnb1Q2WGJlOWp5ZS9N?=
 =?utf-8?B?QmlkRnhPYWErdG9SNDdBbHc5K3hLdHJvcmZPUzFTL3hXNTcrMkpobVQrTE1T?=
 =?utf-8?B?ajZpMGhyOFNxYUNBWk0xMHFHaVI0SDI3TCtRMm1UMjNoY3hCTlp6R2dhYU9h?=
 =?utf-8?B?d3VUSlhrMlpzSmRDeTFOVEtpS1hiRThXNE9KeU12dU5qeWNWQ2xhbFM4TnRU?=
 =?utf-8?B?Sko0cHBLSzZiK3NqOUV6NlhOSjZyVjA0SXRZaDhXbFBzOEF1YTArSHp1TmFZ?=
 =?utf-8?B?QmhySjBUSlQyRG5waE5KcGlaWW1YRHNlanpiaklGdkQwS0d5SkQxOGpxSFp0?=
 =?utf-8?B?US92MlJuRjhsUzlHNE8yNnAvMDM1RGE1ZjAyZ3NkMTZtK2k3bm9VWjNsOG54?=
 =?utf-8?B?QUxRR2VKYStiRndZNm5QVlVRSExGcmdabHBwenVZU0VKZGYzMnFRK2dEaVVZ?=
 =?utf-8?B?REhtNGZOU05qVEpsaWwyc1lkYXhTY0t6WFppT2xsMi9kZ3p2YU4yR0R1Nm5x?=
 =?utf-8?B?bm1yUUV0NlpIU3RPcS9xSkt2WW1rd2ZBMDl5RWErWnVrOWFXOExMRVZrTk4r?=
 =?utf-8?B?cTJuMzRSNXd6UnU1S0l0a1ZuQ1IwL2YxVU53SVRGSGZsVkN1cE1SdzFmbEpH?=
 =?utf-8?B?anFyOUloMHFoNVdiY2NyclV4QU4zSDZ6c2NGNmlzNk5qbXV5Sk9FTE5Obmxw?=
 =?utf-8?B?RWhiUGNNZDNSWVNRRU5jdjJSdHVlNUxlZHBtTWxHMDFKMDliMmhUZVdmM0lK?=
 =?utf-8?B?TFY0QlBCS1VHU0NLa2RGQjl3L0VsY1duc2JRajZCck1HVWZJVVFNbVpHQTk2?=
 =?utf-8?B?emwrSG9nY25NTXNrUS9jeXYybGx2M3FaOHZpMk9JTzg4cTJCalJ5bWo0Wk9O?=
 =?utf-8?B?NHIzcHdOSTdQLzByWVFRT05hL0ZtbkhLSjdsVytuNk01ZWVVbVd1cHI3T2lM?=
 =?utf-8?B?Vk9DMjMxYjEwbmlKOVk0NDZTcnhsVDR5cGVXVWlyenQrZ0pGNHlxVHAvaEhZ?=
 =?utf-8?B?TnB6Vy8vWnJ5VWNNNDVlbnptM2xqWUxIdFVOUVFZS0VRMndNdFRBU09UQWx2?=
 =?utf-8?B?Y25TRHZSd0VNNEJhcHdzMlNsKzZTZ0J3aUUvcStRZXQ0V29KYW5Jb2wvVTV6?=
 =?utf-8?B?bUI2cmRNOFc3YjdabzhsazlRR3ZxeUlkN1VoeTRJYVRGS1RjRFFsWlZFVXRh?=
 =?utf-8?B?c2VaT25HQk5nQmIwai9zNXQzcG9SZlgwR0g4SFdKeW4xVDZCSkI1b2tsVjEz?=
 =?utf-8?B?dGV1RkhXYm8xMThkQmM4cjhyd1BzTWo5c2tBYk9GUWxMQ1ZDVDkxZzZ2MWVq?=
 =?utf-8?B?c0x6eE5vd2ZLVjdNcndvVlVNSVBIeWRpbmtZYkJpaHRoNjZCaHV6NkladDR5?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3044933f-198e-4d1f-31b2-08dd4f4c78c6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:13:22.1662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVtO/VUzFDPnzcFTIuN4n7CjuqZ6S5P9qIypwkdNuGXXaxs2HUlPCrzv+eCyurlw6zFIFpSCpreJJszHsXNf/ODjGg3WJiJHzIdiPhtIJdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11031
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 12:13:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6385

Hi Antonin,

On 2/13/25 9:23 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Now part of the documentation.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

