Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE79D31A3C
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 10:01:33 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6934.1768384880494631543
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 02:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=gPuTBRKR;
 spf=pass (domain: cherry.de, ip: 40.107.162.4, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wX3ndHTkcvcAs4VTHh5vbexFKIq5cV134Kb12ZSPyIsnDMyJYTIX5XDlmBW4fd+f0ImloPEdTSHbCG776mxfzilcqz2t8AhxK/YbogJW67qUBtQpr5jKqMFeTl/Uy/mx4Zsxwq3KFUlu3gAu1LI4qeMGdu7RUoRx/OzXg/7ueio4NkDbijMAmT/p1IlWXVpBmfCHX1YIk9i77auE8ILji5h1FecA4Nr7X0wTj3Rb0H1nGenX5l33HtQviaUyOFLlMDkkEfvmzPlM3wtq9HEN1nD2I0SSJYLZxgptWMIhg9AZ4Dfaxm+/h7eOD2jbhclQcouVI16BZBmK6CEmvkUMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yV4m4aFiLPEhTzD7fooaN2qo37aCrCqPJIM6QQai0O8=;
 b=NV3s8zjjABEDnpIyAERZm/VgG7QZgonbHckOjWBJ905vnJ+zUWP7PXc/hvkDuxVs3fffIxQtPQAOP3hnKWMAEbhSzfWnQWCfnDLdGAdwKnc/2gTZ3zlhFR30i97bFMjzl1J4hgtS/egkGjVnCQziyuX5vCkHdbYaIibfjpupZqI4TUpVp6G4BxlJ7xsZ8GQQ/ne0/yfGhPOvYE4rXVGqHXa2qTWTnIt/zepzdqSqKlWxEQgmZVu6mIpSXbDoS01dBR0Acs4RxVSVDCXozOfJEtT8TySsLcbtaQ1vn6F1T2ZoEKhPZ6eqy2tUfNQF+6hrbeJyMVjtek3WYXtOtDkOAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV4m4aFiLPEhTzD7fooaN2qo37aCrCqPJIM6QQai0O8=;
 b=gPuTBRKR5pfKih1ae3dYe5f2xtZgXSrEPGRE6HwNvoXPLivazLEFbfjdxQRzSVIeEbLpGq4+j+zigT7ryehyZoQHS6KFsxviLd/TwoiP9YnIWgmoe5nqzNueOoMM5VX8X/rJOsodMMNeYpzIz/sizAfZY7EKlKq4ul5a5B8blEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by AS4PR04MB9412.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 14 Jan
 2026 10:01:14 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 10:01:14 +0000
Message-ID: <6248e54e-d7c6-4658-8f99-e02188cf0aa8@cherry.de>
Date: Wed, 14 Jan 2026 11:01:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/3] overview-manual/yp-intro.rst: fix SDK type in
 bullet list
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260105-update-workflow-diagram-v1-0-fc1c6f402064@bootlin.com>
 <20260105-update-workflow-diagram-v1-1-fc1c6f402064@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260105-update-workflow-diagram-v1-1-fc1c6f402064@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::7) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|AS4PR04MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: e4df7706-e1ff-481d-d0ef-08de5353da6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z1lKOXVwOHMyYW5WUjVhQnZGMUpwdTNsRlFRUThPNmVzY1NMWTcxTnJ3MTFH?=
 =?utf-8?B?ZWhyNjRZdDEyaUtoOFVmalNpam9lekhhUlNCSkEyd3llUytGTGExbWZIa0ZC?=
 =?utf-8?B?L2QyMUZNQkFKZ1NqL1dGcEp3WjVHZ3VvOTRTNTVzM2xUQ2RvMFRJNE1PNkhN?=
 =?utf-8?B?K2UvYUV2Ung0Y3FYMHpWbm1zZUV2U24yaUNrVnoxUkxrelJ1eUQrRWFLL2N2?=
 =?utf-8?B?SWhFa1EzdHJQVkpPYm9nbUpvVU1YOGlFY05pWFpoZGVOY1NYT05zaWFjZ29I?=
 =?utf-8?B?elV5bVJEVlhXcnR6MmRDZjNQS3VZN2ZrQXN5K2xOUkYwRWZGeVBJejFUbDd1?=
 =?utf-8?B?cmpwVE9TdGF6anZaTU9yek45NUU2NEltVkVNc05aREZMc2lmWEJENnVRakQv?=
 =?utf-8?B?NThPYklhK1U1SjZhZFpZeHcxaFVEekJqSDZyalJMY3RwVXV3OWNnUVNsK3dy?=
 =?utf-8?B?dEl6bFhIeC83QjhXOElmUERTdDg0b01CWGZrVTJBdTJ3SUtsU3E3bGF1eHZj?=
 =?utf-8?B?UDJwbUR2Y2NDVkI3am54YS9BdCtkUDFYR2JncG4zcXVna09tQVh0ZDNFNTBN?=
 =?utf-8?B?SmRDYmxibFdHSUpzU1J0emNkc0JOM3h1a29zcGFSeEV3TDliT3FKem9BWkJO?=
 =?utf-8?B?SlV1azgyQkhoUU9RLzl3RTQ2cUU4dGU5Y1NJLzJ4bFo4c2g4TjJMbFd0MDE0?=
 =?utf-8?B?SlIzMWNMSTZubnlHVmRLcmRkSng0N1JLOGs0Uy8rTXFIOE5UWGJuMDJZQzhH?=
 =?utf-8?B?dk00WFBCSkZ3WnQrZkhSRGpDZmtza0ZKMDR4YytqUGNwUlFzVFppcUV4aVFQ?=
 =?utf-8?B?ZERSRzZKS3FUU2lydXAzUk91YndzTUVrRXkwdzhSelNEQUN1emdwTHdhdjZj?=
 =?utf-8?B?bmFPRmkzdlFKK3ZncUNJbGdjeTZwbEJpanlFOTJwOGNiaExCQks0REo4a2Zn?=
 =?utf-8?B?MndrbXVPRDVEVWxETVNmc053MjZidUhURnp3WDZpMlhick5McElJR21KeE9H?=
 =?utf-8?B?ZDFGbTdSdU5rSS9ETGtJS0x5V014ZGVuMlk0MmJVZExPb3BiMEhtbFZyd0wz?=
 =?utf-8?B?bUF1VWxnSkFtWTRvSzNXcFJ4bVFwVVNwQnBPOXNjYjJjdkl0RWtQRzJFU3pu?=
 =?utf-8?B?aDdtbFY5dFJ2YS9NYjI4QklnQk1sVWJpeWVaTzB2d1FnNWlvRDBLa1lDK3Ny?=
 =?utf-8?B?ZXVzaDBlL3Y2b1JJL1NmZ0U1Z3R1SlM2aVMyRDRxbGFzMWNuOFpGdEY3TWMy?=
 =?utf-8?B?RWVVdUhqY0c2U05wVU91UFRMeVlzeWEzRkx2WFhXZVJ1OW5WWk9aeDRNZGFr?=
 =?utf-8?B?L28wUHF1QWhvUHpESDZyYmo3OVdLNEpNeDB0UjJFQVJ5UGJVU3NsTWI0UG5y?=
 =?utf-8?B?bzV1eGt5UzNtalNCRm9UTzVtZ3U2WVpMYUN6Zk5LMUtJc2FUYmViUFZEUC9K?=
 =?utf-8?B?SkpYKzZkVGVWY3FWK3REbjBMdHB4dTQ2dGdmd05BYmFGRnZvbnU5aGY2Mmcx?=
 =?utf-8?B?SHRHQnJnSkt1ZEpyb21yY2RBQlJZSEtUSFNDYVpseDgwMFoyQmZ4YmRZZEp3?=
 =?utf-8?B?TmQ5cXlWU09yU2JreDhVTTduQUdnZHdIaEl5QjVsanRlazJ2bjR4QkVsQzVr?=
 =?utf-8?B?Z1ZJdGFoZ0g1MkZvdVRPSUFlTDdQSHdEMDhaUERmTS9GMXVnZ1Eya3RWRTRs?=
 =?utf-8?B?SkdrL1R1eGRvdGlja3BLWTVsTS9kM3BTVElwQnFpeDFYZk1RMk1pRThwcElk?=
 =?utf-8?B?NnRFSzdsZVBJNk4yQkJMSG10OXFLNkxML2VqRG5EZGNwTFVxeDJZQVY1NExZ?=
 =?utf-8?B?MjlxYkpaQ1ZHblNHbW1Pdys1dndYSklmU3VvcS9BSEIrTG9vWmpFSldoMFpY?=
 =?utf-8?B?Z0NWcStsdXZHaUJzWlFuZXlKL3dvSmRFcnI4ck9NRENVeEE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dFh2N2h0WFRtK0JnMlQ3MmdBQ25hVEhUb2FTY1NYNWx5S2V6SDBmZUNndTZJ?=
 =?utf-8?B?QU1oV05PVWRydEw3RGpvaFlrNkR6ZW1FeDdPOVRjelo0a0Y0SDVPNXRxeXhH?=
 =?utf-8?B?cisrN24ydUVYSzRQenRRTnU0Q2diM2t1aEVhaGhjUkt2QThTVmtMWWxFbGVZ?=
 =?utf-8?B?cUpnUmk5TGR5SDFuTGVMUWRQNXlpcVFqNTYyaEVBZjcvWVE0czRLSkJnMjFD?=
 =?utf-8?B?KzV5RzV0MC9EbGc4eWxVS2doa3JOSnpudXFJOWRkN25vTU5KYSs4M3h0OGVv?=
 =?utf-8?B?TnJOZFltRmJrNlpkTUt1VXoyMDRTN3lOZGR0MzZ6QXM4cTlRTm1pZzdTVDdy?=
 =?utf-8?B?VWhjMTVZb3Rwa1NlNmd2UnY0YmNuZklNb08vYnZqZ2NTeCtKSXgzbzVHdmd5?=
 =?utf-8?B?RVV0SXNtWVpLS2ZxVFdZOUp2WGtoYW1KRFpqRSs2M3BvZEgrNGFKVkdZZlBx?=
 =?utf-8?B?cWtnNVpZREUvOVJTRk9uVE5OTnM0QWpjNUJsRHQvZ1BtS3hldEM1MU15aENV?=
 =?utf-8?B?UGZDSHViVDZ4OW8vckVySHhPcWZvTUZPYzhEOExiUWUvYXNtdSsxUExvM3JD?=
 =?utf-8?B?eTJFN2cwd0Izb2lsNFpZSjZFL2phaDF0dUxGSTdOZmFIZ0ZXY0UwcndEM1M5?=
 =?utf-8?B?NnBEUWIxNXRvVWhyTnh6c1YxUm5vS0dJSkNGcG9Sc1Q3R0pTRnJVejlRMkhz?=
 =?utf-8?B?U2NCay9haHVuN1RCZ0FrTWRXemFSSTdSS3I4MmsxZlhQMXNiTlBSSzMvaUta?=
 =?utf-8?B?WkpidUZuakhKR0NUYk9xWXNKcmNnRy9SaUt6TEpMT29KOUl4TWsyOHdsNEJz?=
 =?utf-8?B?QXF3YUMyWUZPQlVuYXNrVHZyTjFlSjVHR3pmVm44UWh2ejNNbE5rMjFNenZU?=
 =?utf-8?B?N1llc1JkSmlpVXNpYXVIWTRJNGtPSXQvZThNUktoc1d6NXdnNnAyVktaaUdR?=
 =?utf-8?B?bVJQY2djNUhIMFpBa3R2ckx4RkhhVmF2b0pDTWVHZG5Lakx1eGJVRXNWRjQ5?=
 =?utf-8?B?YnRKcDJyOTdPRFJERmQ4S3hGVmF4M2dVcWtSa1d1YVhaZjNkcTl1OVEzVm9X?=
 =?utf-8?B?anFzSFFUWFVlS3hCeGIwbHZnSVJ6TXdkZ0ZmOHRCbHZxSjhJcTVoRFgxajhQ?=
 =?utf-8?B?VmZzbkgwS1E5YzNRdFRnRkNzb3BlRkZkQy8wVVBTUFJ1TWMyTkh6TlZNSGxU?=
 =?utf-8?B?MXNkemR0bWpyU0c1dzh5Qk52WVZORko4cnhJTTByZjBoK2V5Mm83cUFyVFNU?=
 =?utf-8?B?cS9zY0FxZ0VBaXJocVY1bURWVDh2T1pPc1FXcmdnVmhVbkNuWDIrKzBRWDVl?=
 =?utf-8?B?Q0EwZkpLM1J4UmViWkI3blE3WURMcWNOVFJ0ZnM5a0d1WCtHa1J3ZzlWNTd2?=
 =?utf-8?B?ay9IL1NIdVMwOEhrdnM5WmlaenUyTzQyUzRuZGhaME4zdEVBeVpuWGFsZlht?=
 =?utf-8?B?OFZUU2F3NTZ2SnY3bDExTnVyeUR2VXBIeW91aGJCYW0zNHVDa2lSOGNtc1lZ?=
 =?utf-8?B?QStVNWM4L29JbFMreFdISEVXL3pmSE14S1YvcHZVYzFOOWRtZitQbmx5ZER6?=
 =?utf-8?B?QldhMUxHbEZBbTJSUWVuazBvQlhzcHg1WHpUdE82SXhHL3BuRTZRb2RaU0hC?=
 =?utf-8?B?YUN6U2k1N1hLTzdKRVkxRHZNSWU5RlZ3MWlpdkIvVmdQV0EwZEw3VlhETUFK?=
 =?utf-8?B?NTV2eExNa0pmTE9IcFBpQ3hNZi9YdndTNElKZENRSEVxRk9oanlTK3UvK2k3?=
 =?utf-8?B?UDh3Y3FJYTQzM3lFdWIzYTQvTE1NOS9tT3BwUG81T1lCamM1bndpZG9aaG5L?=
 =?utf-8?B?cGlUSmgzZ3hpQ2xsZEZaeHp1TWE2L1JvZ0RMak1DQzZYclJXUGtxTUwwTjlX?=
 =?utf-8?B?aHRUa3JXNjkwVjFydUk2Uk53TzhSMHRySEtoUmpLTSt4RWE5OGVFOHFxcndS?=
 =?utf-8?B?b0RIZ1dLelBaVDJGd1JCWFMrTTlCdXVQV25IdnZzV0N0TE82bmY2VkE2TlRR?=
 =?utf-8?B?YmlMZXVmcko0VGdTbzF2dXVNSDArS2lmanUrTDFadW0yWTd3S1hFSVNwYTZ2?=
 =?utf-8?B?d0gwVGphRzIrWVN3VUNMeHV5ZWU2d2U1QkdUZGJ3cEcyUHJYK2g4NEJyME9I?=
 =?utf-8?B?OCtJV1U0TVc5S2FnVURnQ250TDFocVlqMlBudzdSTkhYUHBzWGU5VVhjVUtL?=
 =?utf-8?B?MW1ubGJJaHFqaFVvNTVneEFJVm5Nbkp0a3Z4R3dkVVpJTWVTMVZDYnFSQUha?=
 =?utf-8?B?WW5BdFdHbWlMY1ZQeklZVm9pdHh4SlpYWHJzbWFzOEM2K3lpTVI4dndBaklN?=
 =?utf-8?B?TVR5OENCc1ZtWnNGVmtKT1BOR3lzR1gwTW5MY085SEtURFQvOUxJQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e4df7706-e1ff-481d-d0ef-08de5353da6c
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:01:14.6330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDJ9e4ZcDAwSSrq/sYmpNnVTTa0ESbSXchyaEAGDV1V9qdLFcX9W1YmFxO16u3S48MYfXFrkA64yuMO3dWIeGxAA/mJWrJNGUXrbmtt3oaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9412
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Jan 2026 10:01:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8545

Hi Antonin,

On 1/5/26 5:02 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The YP generates an SDK by default, which can be meta-toolchain, an

What do you mean "by default"?

> image-specific one, or an extensible SDK (eSDK). Don't be specific in
> this bullet list.
> 

Isn't "for application development in parallel" actually specific? I'm 
assuming most people will not use a normal SDK but an eSDK for 
developing software as the normal SDK is (as I understood it) a minimal 
toolchain which won't contain most of what people would expect (headers 
for packages found in an image for example).

When I bake an image, I don't get an SDK automatically no? According to 
the docs, I need to run -c populate_sdk/populate_sdk_ext for this to 
happen? c.f. 
https://docs.yoctoproject.org/sdk-manual/appendix-obtain.html#building-an-sdk-installer

The docs were also very confusing as that is explained **after** how to 
use the SDK and in the sections we just say "run the script"... but 
where do we generate the script, where do we get it from?

Cheers,
Quentin

