Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8E6D2D11F
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:51:03 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60795.1768315860128332560
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:51:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XSyqGxQX;
 spf=pass (domain: cherry.de, ip: 52.101.72.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjkIKNOwMsunqX54BXyhQV2584zzVjsLw2JmB+6yYhY475J8deD97RqnMSXpcGO9ifyAzXAv7wK1eAFAgh/C6w4MFFR5QWmxCTLSdW4N4GnmF9oSO4DudwUxxoQ4g604dSzKkNLCvdTX6WuVkRpA5AVn0NcIVeICTgFIH0d+t/15TP+MonV3chSneGaT6A+6uT8dSf7AU58ITrQnmWi6FQ/hTS6W+e+it8WEd8JlNCxA9gxBN2U3BAm61fRVq2mZFMOi5r6wENGy83t8ul9Qajxn6hhCtNssvHASLPCACRt4+JnotPuDtSu6/odoS3kZtCnpk4Ub//d3LZsOgSiA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=efLN336NOLDYANnsjBcXM5os1z4mSWRWXum/F9LhpyCIuY01mwIk4BzRW3fuwWHJn7VCYx7WEdfEUyySFtJmh+No/5sUxcdjE9RVZtUiYgUE3OjaL58LnDQgpNUuekUpVFQobPH+gVxt8Moh0EZalysrNkGfbNe0tD+pnizusN2U/zDLU4BSBqfDtOuf01vPHVY8OAoMYXz5W+UkcfVIwBVozDtyoSOeCT6O7VvbePGq5bM4QXX6vA7haLSYXdsjc8g80qwNY/vIaILCB8R4/JDqXbbglk3/sDV63Fc6wesVzjGeeNSs61tJhjyp6o5rcdduVsAllqQMSRC03896fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=XSyqGxQXAxP9vff8qiIkpYOTUZHSg1SYH0mBaHPgEeIHuTG/J9NCoNHZE/4wU/bzE8nMKCqvNGBxchyPnoEjaojzTyePupCPt+zhV2MTFkAa9Dsis3V0qw7Ndsb7IOpv6G/ECeFSb+BbjGJjSpbfE45MdsZFRBZw+pocrfixeJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB11516.eurprd04.prod.outlook.com (2603:10a6:150:284::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:50:54 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:50:54 +0000
Message-ID: <ab3d6445-5464-4e98-a880-4bc948f44b62@cherry.de>
Date: Tue, 13 Jan 2026 15:50:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 38/53] dev-manual/init-manager.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-38-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-38-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB11516:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c2e016d-a808-4d6e-778b-08de52b3270e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VjBIVGRiREZXOG5EYi8zVVJiV3h5L2xKSjQ2Y25keU4wREJQWHpVRE9hRi9C?=
 =?utf-8?B?QldlTXI1bjRYT2FyK1B3NFQ1alNaZlJoS2g5czFYS3l4US9yMWVIdW5WUjlD?=
 =?utf-8?B?WkEwTXhETE5MK3BHRDJRQlhha2xxcm53UExTakRTNEV2YTNheEVmV0lraFd4?=
 =?utf-8?B?RzZwQ1Ewd1FGYmV3ZlVoQ0tNNUlEczByWDhKemgxdGUxOXFqTGlaRXh6ai8x?=
 =?utf-8?B?eDRrbEpqa2NKNU56WHhQbGh2S0RYd0d6Rzlabm5sUkJ4Q3RudzZpNGpDb3hJ?=
 =?utf-8?B?aVp4a1lIdzk2VXhabFhtU0tEYjh4VldIRG9XM1Nvd1BqdUNXVUxpZDNOcWZl?=
 =?utf-8?B?MFFPaTBLNGYxb3ZLaHZ3djMwRDI2SVVXczVXcHNMOTJlRmZ5ZVFxK2tNN2FN?=
 =?utf-8?B?Q1o3anVOYThXNjNOZEJkMS80NEovZnV3d3J5R1A0aU9ZdW5pb29SUnhQS3ZV?=
 =?utf-8?B?ZGVNRXVQUEFhaDRhUkZCbm1xVnhGRTVHbGtqM2NMZm9SNDJ5RHNUaVAxcnU2?=
 =?utf-8?B?MWd6Rm93aGdUMFdHTVIwSWljekJLNXRrNU5PTnZLOHpPTEp5bURwNzZtcVl6?=
 =?utf-8?B?UFk3LzFOU3c5ZVRBNGNBNEJSUjJlajhCTjVoSjl6d3I5bmZvQjRKWUg5cWV0?=
 =?utf-8?B?YlhIdDhFWlBaQjJIMFRkMS9zNnlwaGhzVForeFgzRWVLdXE4QmtLUjVUaDAz?=
 =?utf-8?B?aHVoaENnYVdtdUdkdGtHL0k2SXU2TnhNQ2YrbXA3Q3pRSDIwYWkzQTZRSUtH?=
 =?utf-8?B?cmtrSTZIUVlhdzhVZVhBVmV0L2ZBTTcwQXY5TXhPNUVCeDZXOTJjcG5VTktM?=
 =?utf-8?B?amJIUHRqTnEwVXlZb3UrMis1emZtclc1NlJXT0UzdXd2SlJFSENqS2lrT3I0?=
 =?utf-8?B?b0F3MFlSZGlMSlg4WVBWTDN5dGhzVGtpOTBlVGZvUDBSZUg2YkxoRVN5eU5H?=
 =?utf-8?B?bVIzM0NPbVRXaVJ0eVBBbytXUDVyanlsRXN3Q1FTZzF3MkQ0NlcvVzduQ1lT?=
 =?utf-8?B?Q0QzZmt5Y01VZEJxSThkMno0OVlVcHNYcVhvTFNOcnozOWdYRERTWUJaaHNU?=
 =?utf-8?B?UkpHbUlCdkU2YUFPSUZwL1NuVWJabU9rOVJjUmdScUZrN2E4dDd3SzA0RG1U?=
 =?utf-8?B?N2dsVm9mUzYyUmZESkRHQlhQNlFaUnFXTTBkeE5qdm5hY3hZU2d4S0FjeElv?=
 =?utf-8?B?VXlYTTJxSzJIWHpacHNEeVNpSHRUOWtmU0h6YWpUZjJOYm9oN0VtbHBhbGpv?=
 =?utf-8?B?YmNhQmxnOFdBajE5TkdCaHY5bVMwMlpxcEJJMzZqbEx5M0RLM3dlNnhKMkE4?=
 =?utf-8?B?Y202NmgrWXQ3QmlZSXFVWllUb3ZYS2E0aC81aWx4YTkrc1BnQXh4cFZYaU8y?=
 =?utf-8?B?Ny9QOHlSOTFsQ3c5K0xTdmd2QWlSZnVSWHpEWkQwWXc1TXVsUG5GMFFvWS9t?=
 =?utf-8?B?OGROcE8wQzN0RUNKVitDS0ZZdnlZR0Y3QWdrenRWS0krZVRBSGo0Y01JRGVD?=
 =?utf-8?B?eEFYdTNQK2p3eVQ0dlFiT2tWMlFNLzhnL3BsbFM5aUFlSEQzMVU1dFNGN0lQ?=
 =?utf-8?B?QVF6TlB6SXRSVG5ZbFBXRGR6Z2tTUytVL0wvdUNROWtHQ2kxNlRvcExQeEZG?=
 =?utf-8?B?Tm9NVkhtWnlobFlqMjgwM0V4STF6N2wzNnNCaGVXTXR2QUpCZE45TjFVQkxI?=
 =?utf-8?B?Q0pPOElRVzc1MnFldDdscjZhaFVscVdLcFNwVnJ2dFRESjVJNUhVVG5rWSth?=
 =?utf-8?B?Y3FoMGlWSURKSWNnQ05UaWVGK1RkZjR6a0lvaitLV2xTeVFhVURDK0h1My8z?=
 =?utf-8?B?ODVQNE0zZW8xc3lhVU1oN1dlNHBGalZxNmd5dWFucS9ld3FWdnRQUUpyK0Iw?=
 =?utf-8?B?MTBnNmdxUk5kYWN4Mm1vVFZGTDg2WkVONjhLM3grTFRyTVFSZm11OHhoaldw?=
 =?utf-8?Q?A8YWGuBf5yArFQlcODI15X6P3CZ1p45T?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OFBPY01zK0ZYYmo4T2taQTVPUUIvZFdxeSs4QnQ0Y1ZOaUZ1MFdVNmJPeGRs?=
 =?utf-8?B?Y2laRmtFdmhoUTQwQnAxa1BBVVVKdVJaaWVjL2dwMGZ6MHowYWV6ZVE3SEJ3?=
 =?utf-8?B?UUh3bkRzWDFhNE1nSW4wSHBudzdTWGNkVjhJRG1aaVlNVllFeElhVnZqWTdw?=
 =?utf-8?B?TC9HSE9tSWhUU05lOWZCdTVtNytUaWZuckVTQWJwdEx6OTdpcm4rYlFqOC9z?=
 =?utf-8?B?NEUzdXUrcmJYVHZ1dHJLZHpXdGNQNjV5aE0rM1ZjTG9KOEw5azhmRnhFczZH?=
 =?utf-8?B?dUtSNllURnprenkxZmRsK0xVaEFPWTVlLytiMGg4V2Y5YVFhNUJVSHJUaCts?=
 =?utf-8?B?ek5ZbGw2VDNCY1lkcG1sbm5vR2w2Wk5teVVwT1FoekduREd0VENmdE55ZEdV?=
 =?utf-8?B?MXUrQlRWMDF2R3FVMmIvRHZ3Tk4ySlYyV0xZK21JaE43VmNoOFdMS21WVS9j?=
 =?utf-8?B?Q05CZldVdVJvblF0aFJsMTBYclBLWVRVVVJNeWVKWEtqNmlvYXU1ZUIvSDc3?=
 =?utf-8?B?bC9FZ2NUWG1mVDM1RVo3eU42S3ZRMHJHZlJkL0FpNWdSdGZUSXV5U3ZlZStV?=
 =?utf-8?B?OXBPOUJsb0FVdVhCajlOZWlsTmlBRTRydzdJSDZNVlRmZk4yRGhTLzNNS1BI?=
 =?utf-8?B?WFQ3WHNtM1I3YmcxeGpYSkhaaGRLNllKSytPQ3FnemdrRTY1aHZ0TVY5eEFk?=
 =?utf-8?B?MWJBVWNTeTQ5NTZKVWt0ZFZIUVQ4em9KVWNLYmFZNldZMncySDYxRVQvSjIv?=
 =?utf-8?B?aVhQM2RocUk5WDNXK0hIZUoxS0tjaEl6L2lSdlpPcXo4MDVoOUFncjdxbU16?=
 =?utf-8?B?d1AxbnBwaEVKMVNoejJsNnJ2MXZucVpYZXdlUWtFc0dSeHJIRFJSVU9wNDNp?=
 =?utf-8?B?SEFQZWk3aCtYN2FLaVhqU1ZJUk01YVl4emxmNHJUdXRQbm1Sc1RncHZZRHdB?=
 =?utf-8?B?RHd5T0kvc0QxeVB3SHFiRGg2VnZnb0ZBWkY0QXQxMTVYL0t6R0RKcE5wRVFK?=
 =?utf-8?B?ckEyU3lyWWlUNEVBZmc5YU43b3c5bE1lcDUrWTBkSENWTDNna1NMbVZTK1dE?=
 =?utf-8?B?T3hoaVRjd3p0TlJtZzNQUnp6RFMrbmdWdmEzbW41TXBkY1JNN3pYZFZVNjNl?=
 =?utf-8?B?dndBM0lxK2dMNmhQdWcwS2NPdGZ0S0Z1MkRGOHlBaVZkMVl2VjlzTG5KMFZk?=
 =?utf-8?B?M0c1dUN1a1A2TkpBb00xUis5djJxSGFTUTJqYjRDUjc5ZnNPSlNhRGVkTmgx?=
 =?utf-8?B?V055MG1Ob1BOZit4Nm85YWIvekxYZVQwWXhRcHduNFMrNVY4Q05ZSGhSdkFB?=
 =?utf-8?B?UTRlNFZ3VktBeFJvM3BnSWFVOWtXQ3EraUFlMGxtM0NHeW03bTlnczBKZkJs?=
 =?utf-8?B?V3dxdjcvbytrNUVUR3VzYzFpaEVaL1J4dkJMeHl4cHJySG9PQ1U5d1BZYWI4?=
 =?utf-8?B?b3AyYkR1WlJIcnFlZUJHNEFhTXJCaHJrYUtpUTJ3a2NkVGdpMkNqbWFiZEto?=
 =?utf-8?B?TmpLRitwU1FGVlB2Q09IZlVLR0xRY29nUzV3OXNOSklZWCtrdkQrTSt1andt?=
 =?utf-8?B?MFU3Ymx6cFlNMkltNXNPcGN4TFRXNnhLck9ka3VOeVNkUDRYNjNWU3pqMXhR?=
 =?utf-8?B?N2hOUDkyYUo4NWpRTW1GbmVJclJEWEFnOS9SQ3c4VkV2L1RFRVFDNlRMTDhC?=
 =?utf-8?B?elU4eCtYNEVkZUdRcExFMzFqY1NFVmlLV0xFaVk5Q0NJNTZWd0RvUnFJN3Ix?=
 =?utf-8?B?bGxmYWNtc0llZVV1VW5nWDBndUJCSVkvSittTVZ5K1djdlpVaG9wSWR1MWd2?=
 =?utf-8?B?SXh2MW51aGd6QzdMeG85ZkZrblc2Q3NkTVNpdThScHV6L2RUWE9PMEVJV243?=
 =?utf-8?B?d0tnS1lFczFsRTNtQzV2YWpRbVVJU1k0Tk1HRExuMlFsMFpLU1pWQTJhNFNz?=
 =?utf-8?B?QnpnM1QrNkMxK0M1MDJXenFuNnM1bjh6Q1lXc1BIOHd2UWpMWEZmM3lmS3Nu?=
 =?utf-8?B?WEJCQXhyTXk4bmxreUZBaExkcXBteGZ3Q2xPOVdzWlhZNWlWZVpPK2gzZ0pv?=
 =?utf-8?B?V0xENW5SbjlKRGJObVNqVTE5dWhBeVQzTnF1QURWdS81bWRBVGdKbm1jdWJl?=
 =?utf-8?B?WVJuUUJGWkpuUUhyMFcySGcyVVdQZmZqSzZZQU1lTG56aVJxdUV3dG9iMGVu?=
 =?utf-8?B?TXhRWndpSHJjV1dOWjh1MTR3S1J3NGF5OGlEUms1MWg0TElubFBVcDBPRjYr?=
 =?utf-8?B?YzdWamdHV0RIZ3VhTlpOL0tJUDkyS0h0M1E5eWFWVmdFOG9Yb0hsdUQrN3V4?=
 =?utf-8?B?QkZkeWdHMWxRRVQ4eUluam5RbUdBYnQ5ckhsQkh0bHVPYmhndlBZQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2e016d-a808-4d6e-778b-08de52b3270e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:50:54.2317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fPeqJUlw/QpHlENs723Whs7pyN1PjoNYpmJMRm8VXB2tVrC+IaJsDBaW+Rm6ZTusPc29FhRKcfh5FC8RV5LCgVEQE5oHUTa7RPGU9Z5PAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11516
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:51:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8527

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

