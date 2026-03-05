Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17574F3094B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:48:03 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42521.1772711276590237937
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 03:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FdaqTmQx;
 spf=pass (domain: cherry.de, ip: 52.101.70.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5vLCZREn0bbgnTH7k1ByJwrn1FC3apNr16Nbhp9cybH4Yj0ZckvJeaw7YFN4G8pBDwybC96ocsNNdCDcNIYmjeyiMBJuef09nPNKQ+lt2Cp6sgLqKITIe4IzpWxZBoHR3tsy/iQcbFTx2b+WW377a6Eh9/y5GEJLlsXm4yjKWOtwlBss6BgAdZsdH4tVghwX0i9fgGYvzrYkmFxEyGCT2VQ4MXI0P8Js0+QUayTshDmaawpnf7p9Ym94ptfWFrj97bakhvX8EU1e8Vf7PjzuaVdgh6QkZ+3VO6WtlJOl5jzMwKCyGjZTcFMfZ9ox9PK5ddS9JqetBunvN/SYdh1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nv1Odqp0OHcergoaB/+LbTwXRsG+4D9/v7LnRa7Ofe8=;
 b=wx5VCOrTB2wABkF23rgi8uzuEMBj5A6Bb3PfyxHRQ6MB8q2kAGAncd37P5HNsfCksha7zwY5bwKzj7XTeqTkxCDHu8WUNj3QjDAzmY+8H3bOi3s/LWEzp97RzeDWRqhjIC4xV+5F1UR4MT31BhC8ynSOuvEBTkmdskyBzsXAWCV1RJP7q2bh9moNLfPIx4JCTw0Y6tw0T5HEdhemxOOFVFzVu/i116IXhUnvaEl2TjgoDI5S5VVEEhyuImHOlQZ7WoPb4B3wK+5cfkaYOg3g5EyRSj1ULPrx8k0fje5BLk+g3gbMR6jQ3JyVDh7u1gZrHIrMsGbMOGoDgeFyaE2VPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nv1Odqp0OHcergoaB/+LbTwXRsG+4D9/v7LnRa7Ofe8=;
 b=FdaqTmQx5JjndDAcMhUFWpNPZwk33im0ibXynjyDvRzal4bqmBr6YAtd87kD7rVJ4kl91S8WQkzF/cGysmoTjDKr6yzwXKx2hrttq3ofzDHrQZ4EEKKKFUQftd46ANJG7yswolb78nGGO1Tm8onuDjdC2nELZa4EMJq/+JjwmAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV2PR04MB12216.eurprd04.prod.outlook.com (2603:10a6:150:336::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 11:47:47 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 11:47:47 +0000
Message-ID: <b545fee3-73e3-4939-bb1a-c4054c1c3fd9@cherry.de>
Date: Thu, 5 Mar 2026 12:47:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 7/8] docs-wide: add warning on disabled NPM fetcher
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
 <20260302-release-notes-6-0-v1-7-9662dee58591@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260302-release-notes-6-0-v1-7-9662dee58591@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV2PR04MB12216:EE_
X-MS-Office365-Filtering-Correlation-Id: 414eaab2-7748-41db-435b-08de7aad054c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: 
	cuA0Td1YVkhwh3JOg53HqYWiFFiDdur7VdhmnSah1RvgstsE4ysHKK85MTnBaoU45bgFCgiUL3YqUUVhOssxtTsM136WZkRPKTwOEu9i6m0DAAR9HFRPz9WqzUQDT3UvF4h4tPPi1A+u5NNKzs2Um0nkZX+fqSUd7te5vSealqoxFnagA6yonVQrB+EvToJ1LC0fzkMFNVtudv1hAmWgQlHMQ4IK+9Ih3Cra5Hg2pVHJTKK5t31GS/hKj7CMth8l9m7ytqi+mugD90gefvDTA8HzDDS1mO/rFZnDVenx+wb05rcG65a/zuOPkamVRBZ8kMGPdb9+bgdFfvOh9mIuFixw/n2Y5a9aIbbGhWaKEGyor4zhcC5XmDZ7ecx9uV8gh7AiKwmqwYDjzCJQ84tw9+sPd8Yzfy7F4vk6KqBu8hLyDoUHW/Y+pqqOZx0rZzvHsEYVlLeXWKpA/yM4vz58Iz0ScSwW7OnkowdoGcNM7TgIRsH83+2ZX5baoBN4YPXv7bYs8mYNizvOoNKBn5Ho/qTYpW9h7uEvCrzKc6zVZShXcPzEKgbRPb1Ai9QUEa2quEQbzTB7Gw4RDWt35UPzjp9sw89Z6GH7JWXDHuV5LuReKTInak7D2KwHYWxMXGD9J2q1L2yjmdOLZtbM3IsLAkb61+j04S7bjXGn5V6ysoP4kGawP73+9/eE2v23jRlXEMrNLI02uxyzgnhHcDIZu5HWxx7dZWjONWZA4BhCB6I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDZQZFZkenZ5bjZkSjFnVUN0S2N6dU9GRlA4bTROdkVGbEEzOHh2aTVLRWlr?=
 =?utf-8?B?UUdlZjhXU1Vhck94R1d3czBzQXlZOVh6VXl5Y29JMTdiNW05aWl6YWhZMi9o?=
 =?utf-8?B?aUppQVNvQStzeEVwejd3R0xhaGJkMTMrVmpZSzQzR1Myc2F4RHR6SUt3VU80?=
 =?utf-8?B?TzZlSDJmVm5MWFlTa0N1b1dNZzVVc3lwdWNGQTB1cmJnVlEwMlpTcU40RGNR?=
 =?utf-8?B?QXgyaWMrZ3N3ZVlRT1lvRTI2WDI2d3FqRndoT3RHQ1pib2NIaTRZcXc5K3dp?=
 =?utf-8?B?eENZYkI5b1diYmg2RXVBTDNpd3JLWUdBZWZkaENoVTRBOVlpQjNoSnVhNFpN?=
 =?utf-8?B?UldxYVBWRUxYbHU2OXJ2ZWtjbHYxZ2wrcjRiUEhwY2tWaGw4dTVtWHJDVnZm?=
 =?utf-8?B?Ny9lOGYreUpUdFV6TWdnSEVuVEg5QnpETnAyK0FmcTNHNWZJcUVOVVlGelov?=
 =?utf-8?B?N05ad0VDcllnVGpoODZzcEtPZEJuRzdjKzVOOFVZZE91NTV2Z1pQNjBwSFN6?=
 =?utf-8?B?WE53VXovaVJmWE01WEN2Y1pDcksvTkV0eE5CNldUUEZwZTd1ZUZ6MGlyNlla?=
 =?utf-8?B?d3JpUC9zTGo0Z1Q5a2dQU3J2RERYNm9EZmtURXk1SzhtZnM5clNKSmVHY2dl?=
 =?utf-8?B?TkpwYmJGazNOK0dYamhyWWl4bXB4TG9tVVlTWFNHRXdkOHBOaUFXNHlhV2Er?=
 =?utf-8?B?TERlck1UR0hvVjc4SFQ1RTVteW5iN1NVVE43cnlMTnRrZzhhMkUrTWwrWmtz?=
 =?utf-8?B?aEFpV1hNWVhyeGNLQW1FNkFxRmJrK2ZZN0ZCTUs4UWllMThsR3BBRlMwclc4?=
 =?utf-8?B?U3dMYzVKN1AvY0QrclhJUWV6Tms5WHk2UVdUais0ZmZ6bnorbnU2b2xWK0ZB?=
 =?utf-8?B?NGVyaWtoVVBMTEJKVUExeFQwZmROTG5xSTFKRXFuWXEzMWVpRnBmRzdwQVl4?=
 =?utf-8?B?RGZ4VWM0YTFvaDNyTHFVOVZwd1BkN2RSd25weHl5RjNvK3Y3VS8zMVdENEUx?=
 =?utf-8?B?alZrZVhtSXB0dHhlLzNweFEzeGw2SDEyaERaczZBR2VlYk9jb3A0Y05Wb0RP?=
 =?utf-8?B?TWtQMzRtQzJzQnp4ZEl6aHR3NEMwb2V5bW5ad0xuRG8zWFlZcGtVSC93SDRL?=
 =?utf-8?B?QVpHRGFNVTM3TE5XMVppeHFMcGhjVk1ESkV2WFhiWmtEL094NmM4MUVJblEz?=
 =?utf-8?B?aW9PVVVvcytxc3VKU1h4VWd3eERrOG9iQmFpZjNhM3h5Z011VENoY0pCMFhi?=
 =?utf-8?B?Qy9ZZEtRV1JDM0dBY2tTcloreHZzNDRkbVBMdmphenVaSFNScTEva0ZYWkt1?=
 =?utf-8?B?R2E5Z1AxWlJOc1ZwUmNYSlZ5dnVQRlVCdUQ4NEREbmZwUVZBelJFbk1meTBt?=
 =?utf-8?B?K3l0ZndvUFhuT1BncytpamRNZGRQTEpDYUR1aHZKbFdQcmtIU3JlUi9NVlJu?=
 =?utf-8?B?WDhjSlZhL01FM2h0MlpvM2JVUGVRL1RQdFkrSHdaQS9Hb0k4UUJrdm5jd3Av?=
 =?utf-8?B?Q1d5OFE1eEh5RXhhdTA4WU5Wc0o3QkIvVmZjVXh2bkE2WXQ4cHRJWitSSmQ1?=
 =?utf-8?B?QTNzdFh1NVAydGRzUk5jT0hBLzhoSmJpRHlvMUdWcW1KbEZ2V3JBZmtIVDBN?=
 =?utf-8?B?cTZTSEdKUlpoeUlGNlZCejZ6ZVp0aFNzdVpma2p1ekV2VHluZGJxU29pb1dp?=
 =?utf-8?B?V3R6UmpCeW1iWnlpK3ExK3NNTXFPWk5BS1RIRnllU3hXY2lzelV6ek81dE11?=
 =?utf-8?B?cnpEWitQQXdLR05MR0tHTnhxZVdSOGpYU1ExellMZ2lxZ2l4bnd0N1U3QzVT?=
 =?utf-8?B?bnVvU29HZVZ2cXRKcVN1OWNlQVN2dFRYdlpYSE9pem5wKzBlWGV2QTEyeE5J?=
 =?utf-8?B?Q2JheGNXZlBnNzB4bXhWZWtLVW5NbVAyOGl4cExPVHhpWEp6Q3dHei90WlRF?=
 =?utf-8?B?M2w5cHNkVVpXMHpJazNZYjBPYWZUbHQ1NnRLcno3OWZjdVkvSEZxVXVuditi?=
 =?utf-8?B?dFYzZCtFOHlGcmttc2N3cUcwQnlBTXZmRE5tSE9PZW02MXA4NW45M2lTbUJo?=
 =?utf-8?B?RG5td2Nka2N1VzJDeXBCbUpEUExDemh3SmtnMWg3T0x6bU4vUFNWNnlqS25J?=
 =?utf-8?B?cmJMUmhhR1BUMXVZK0w4NG1DVUl4OGxRQ2tMZlhGL0pOd2o2U1piWXFYN0RD?=
 =?utf-8?B?eG9NWjJOT1A3dEVFTUgrdksxc28rUTJYaTRHazlncUpJZEdMRHIyL0xNT3dh?=
 =?utf-8?B?ZTZ3Z0xWekpid25ILzlTMGNHa2hFUDYvNlN5VjZGdXRvZmpDcFRPaFFSZnRJ?=
 =?utf-8?B?dEt3M2xuSjVJK0hYRkkwc3ZWc3diTFZ3MUxLcWtnUlNDc2d0ZnhWaW5CUlJ3?=
 =?utf-8?Q?N5KuSMp7m5/B7wXvLgW/oqV0E56OwCL+9vQty?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 414eaab2-7748-41db-435b-08de7aad054c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:47:47.1579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHpuz57lEx/9+imaUd74EL4TpFfC3QG5a20ng2gt70akTlMm7zJBgSMhl6s6IJ8831ezyDOZIbxOR4AE42U5Avgie5+DC/ZKiLMb7+VTqFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12216
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 11:48:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9066

Hi Antonin,

On 3/2/26 10:37 AM, Antonin Godard via lists.yoctoproject.org wrote:
> The NPM fetcher was disabled with 355cd226e072 ("fetch2/npm/npmsw:
> Disable npm and npmsw fetchers due to security concerns") in BitBake.
> Add warning notes throughout the documentation to let readers know.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

