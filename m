Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5993FD3F065
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:04:33 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13609.1769609065399199690
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 06:04:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hNCH/ovQ;
 spf=pass (domain: cherry.de, ip: 40.107.130.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQakE3LKdILrbXO1/N/a20nKt3t0iLbIIFm37iaGtuEFnzZAvh8bkni+vTjY6vVOaEqU6T/C7xqsbUN+XQaVP0i2HhwgYQk3xl9lRLcyujH4gNinX7yDgbfQKLMxOk/QQJQDWT+HGV3yTxWfUhaCOEIJReVIw8gKNPB+UjODV2pGmipNFZIYQrNHLbZR4W4bW0XNqMan485s8J26kQemtQsz5hM+Fd7J4gsmYWiXqnEYCcDpZyHBFDrpVWgRmZmrde4BsBw2UGhJlTqmIvJNQEiTeNSs8YuBf5x4gYJyFMJti85JYaUTwf/PH7u3O5OzmZNDIYyiZ+3p4dfK7wx6vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=SsdI5H1G02nojfYgAJmN6at/RJi1/arwhLq+RibXmSdPKZUb0NNY0bgmFjD7i+FhT/hK/A1E3+xWBBjzduFMFhAlAS5/TqaUp9bpIlXL7sLLomlbafiZhqkZ7vPvfeOcJu0UCtgvt1bgpaJmj0vzG98OnJy6T62N+WCvpPPLpB85AJwalW0L0zt+OHRHtwSkdbgsKbJ0kUCrZXq8UkaGCR+txwchZjaHcAMVwdB3DTtw3WYOBbpTQHRu6Ad/1oki+e6+MxaA2j6uHyz6rGasrbWOJrKUEDV1p6Y9f7wHKMij71gbcfdnexGN5qyv+Lhh1DIngMqym81nqkrxUbGuWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=hNCH/ovQRGyCS+p2Er3+qxmi+XkuMC3ixXk7b7/t9F4uTiEF0vgDemz+oB1+lBg9oDSNC4XIPOCf5zYE6Xz3Qb8I29l+tWXyCxqaEdFzZDpQekf70vYcdBDEAOowV58IyQUMjlCqoJkincT4tor34z7gi3hJgTIcQzb4xyeA15k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7995.eurprd04.prod.outlook.com (2603:10a6:10:1e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:04:19 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 14:04:19 +0000
Message-ID: <119425f5-511b-469b-b329-491467a156d3@cherry.de>
Date: Wed, 28 Jan 2026 15:03:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 43/56] dev-manual/qemu.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-43-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-43-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a4ea14-0bab-4523-0459-08de5e7621ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OGI2c3ppM1daUzhZYkNrOGVYRVFzZ1FWVGFRYlJRWXMwN05qNUpWc3V6cWpK?=
 =?utf-8?B?Y2lHenNpU2JydkhrenUzQjY4TUpBUTh5VUNTRk9zLzZ0Z2x3Ni9JK1ZyZ20w?=
 =?utf-8?B?Mm9NdFRIU3VTN3VYU1EwdU9HakxiT3JtUjhBOWZRaE5wdWlJZm94U0NLeTMy?=
 =?utf-8?B?c0ZzOXhhK1djMTR6c3N6Nk9ETnNBVS9vSHF0V1lPTXBySmQ3SXFqb2p0UW1w?=
 =?utf-8?B?Z2lHYzhkcmFUbmZZU04wazc1L0lnTGpmTjdjUW9BbHBFUG9jTElwdzJDZStq?=
 =?utf-8?B?OTJ6MkFnTWN3aHVZMDUzOGFnVmhhZ3JsSjFqMGFRUERnWFRGMVJudHhuZHZm?=
 =?utf-8?B?NmhzYnI2WkVrTWsrNXJhTTB2UTJCdWlhQW10TE9DNzBldUxlU0hSSTFsd00x?=
 =?utf-8?B?VWt3dGtIL0FxampQUFc1S3I0VEpWNkxXc1U1QUlMRThqa0pYSkhDZ2JsQXRS?=
 =?utf-8?B?VVFicGtsZjRzSDcrcDdpdXoybkgvQUZ1L1Y5QkJyTDhuN0F3MmV2a255ZEI1?=
 =?utf-8?B?ZGQ3Skg2MWttZVRYak50NTBGTmt2b1hpRGJhNUNpdnFqZ01iWDA5Z3N3Zzky?=
 =?utf-8?B?Zm9OTmtsVGFsZUE4ZDhCRWRGaGxxaXdKbHdaQUxranRpK2pmdkVlSi9sV09l?=
 =?utf-8?B?cEE1NTZzS1BoSlVRS3pRSHRDSWZjU1hQZ2wyZHQ0ZFNybFdoRjRlK3E4dFJI?=
 =?utf-8?B?a0pGc3I3cm5zdDNvRkxUeUUvM2ZIQzVRQWh3eDVua04xaGFVZlN1WEdUTHMy?=
 =?utf-8?B?Y1QxV0lOcnlTMXdVTGk0QlBmZ1NtQnllYlNxTjNmZUU2R1dIUkVwam9JcHpu?=
 =?utf-8?B?L2dhUkdJVjJVNEZtczFrYTNDaitsQlVacTlERDBqTEd1RXVjNkJTOFczTXl3?=
 =?utf-8?B?Q2dxSnI1SFRDQ1pGaExReDA1bm5FSXhxMFR5MXFJM3FmKzNINVovOGRoMlFT?=
 =?utf-8?B?RExGNlZ4SDJQa0JBcHRtUm93bjlwSzkxTTFZbVNuUE91UUZ5VndsNFdLZ3Z3?=
 =?utf-8?B?bXQxZHdFM1ZKdDlyRzBDRUV6UXpienZFblo2ZHV2REkyYVJaYnVyVjJxNGVq?=
 =?utf-8?B?RTNBdjR4d2NMaDJ0UHF0ckFVL1l2MnBINXQxUkZ6OUVERnAvdlZuTDA2ckxn?=
 =?utf-8?B?UjZ5dDIzQ0thQTVidlNyY0w3WmQ4Wk1qWm1jT3RlQ2d3K2RRSUVSektBR20r?=
 =?utf-8?B?YTRReXNEc1hlTWhUVHN6N2dSOTdZVnpkUWVGN3V2WDhSaXpEL3BlbWJzZWFY?=
 =?utf-8?B?U0JxS3NGcUROOEsyM3I3ZG43aWpGRXh0Y0hDeXFob0d4a1VuRC94SUU5MGxr?=
 =?utf-8?B?MkhyckREMW1rSExBNDhac1J0VXlDT0Z0UklZYkhHNEdJVVdXYUNJOVZCZ0da?=
 =?utf-8?B?K1pNUy9ka0RCV2o5alFGN0xBUXQrS0I0aTFuQXczcGkzRHFYdjIrd0YzSnh0?=
 =?utf-8?B?SDZGNzU0ZUZNck1QUjJ2dENwc2haSXB3UkFFaUxtNGhDUmxTUXVRZTdMVnVH?=
 =?utf-8?B?aHY0a3RhMThVeE5Fb3laWTBVbXc3eDJONkxUTzdYSXZUTFgvT1gyODRxQzRr?=
 =?utf-8?B?ME9HU0Z1eU5ZOUFINGJBSVUxNHhVU2h5ZkhxMDdKS2R6RHlYL0RKd0N0amd3?=
 =?utf-8?B?WWpvaEtvUDRYeGRFWFMzUlFmYjRGcnV0ejFlSTBSN2llemdSbFEzQy9xNVNj?=
 =?utf-8?B?TTQxMTA5YjRGRy96TUJtM3JUQVVmMEpZcnFweVRHSy9FK2JPUDZWVUsxNE9o?=
 =?utf-8?B?NXg3SDNISE53T3B5WExHSjR5OElPMHR1NHpxSFlUZGR0bldpZEI2OEplRmIv?=
 =?utf-8?B?OGN2RmFZWGw1Zlh1dUZEQjZCb094WmFOUmZLY1Y4bGlTUUhGbWVBTU40aFVz?=
 =?utf-8?B?QXFxN1FkeUpQb1Qxa1B1b1gxS0g2Y0RsZ3R2VnFEcTZCMlg5UUdkQTFHM0t0?=
 =?utf-8?B?NDdYTGNkS1lMSTAyNFpmRU9QaHU3QW00MlpJdExiYUNMczdnVUhOdjltQWJO?=
 =?utf-8?B?M1hPclFDYzZ3Vm9lRjlPQVVFajkxZkI3djJQd0VSd25aYUs4ZDdXRzRtQW5E?=
 =?utf-8?B?R3pqMnB2aGF0N1ZIdDQ4TUY1WXlTQjNWcjNuWFBRcWNOeTIyTS9WUHNwOHEr?=
 =?utf-8?Q?lBKQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d09uVjE5Y1g3SGF3dzQxd3dHaHl5cXkyVStDWjF3V3pSQU1YRWZML1lHa0dt?=
 =?utf-8?B?OVIwQkJGcVFFVG8xU3lIck5Ock9Ldk41bjZ6YkhtVGJIcnR0ZkNTeXVpYUky?=
 =?utf-8?B?d1pPcmtFbWxBU0x4akNKeDBDa0Q4aTRXSGZJRk9FUkJKU3FPRnRRV012R3NT?=
 =?utf-8?B?QytCbWlsQk56UmJ3M3VseXQ4emR5YjN6M3ByTk1SQit6aGhYck9URmRYTGVQ?=
 =?utf-8?B?cXI5ZW1zVWxuSU9oL3dsVThRMXJjWTFuZGlQeGZ1VG5lS1ZzWEN5QmdZWGw3?=
 =?utf-8?B?dGtMTzFvUW1HYVhlZnZINHdtaWdrbTJXaTdkOHFJRW5NTzA1TDBMOW8vcURu?=
 =?utf-8?B?ZG9VKzRNLzZ3SDh3V2dYeHI2VWVmRUR2OTY5Zy9GV0hWQmZabXNvQkZkUWxq?=
 =?utf-8?B?RkFFUktQdW5BMzdDdU1TTnJYUmxNUFhCMEFxWXYxUm56S0czcVFnTUFOQjU0?=
 =?utf-8?B?RjdYSXhjM0diUFU2RjZ1SU5BVE10RDI5clpuY1R1eUJUTDhZL0lNdnlscEkw?=
 =?utf-8?B?b2wvRXZ5akQzUEd5bkd3WkRUZjF5UXd2MS9GQVR1bHNYcnYvRlFCdjBrSmhW?=
 =?utf-8?B?UUZidWF3WndRRUNEV0dFMFJiTW4wK2VoTzdaQmdvT2p4MmI5K0htc1AvN1Mv?=
 =?utf-8?B?Vzl2SkVyd2FqcmdoM2dkZVE3Z3lOT2x2dTZjdDVFV3lkLzNHZzBadlVJTkwy?=
 =?utf-8?B?T0RlaGFEdk1XTlFZblVpTGtHL0xVemhzbVNzYTViazNFR3djSEkvb0g1bWEz?=
 =?utf-8?B?Q2szWXBCL3dDUVV1elpDZGhQU1dRNURxSXNjT0J5bXh2QW9xMlFpVFVxejl4?=
 =?utf-8?B?YWUzYjB5QjFhd1VoNGpPaFRNbzhVZ3o1RklueXhuMER1L1NtVEJkcm5DOGU1?=
 =?utf-8?B?VmV4WWZPbC9LeC93U2JDZGFNbUJwWjRhVytkTlFEUjlMUTkzamgvS3VETTYr?=
 =?utf-8?B?NnZHTVpNL0J4TUdMVm85NEJ1TFE5Vmp3QXRxY1JNSmlyU1ppSDNOSysyUFQ3?=
 =?utf-8?B?TXMrMjBaV0tod0dmVlJFV2lzQnlLRFoySWh5dnkraFBDUUNqNkd4ZW1TNzJQ?=
 =?utf-8?B?c1VyZ1F4aFZsOW00aFU0blRXaGhBcW9PcG1Tc3Z5ZlVQSGEvVk5yMkFCNkZJ?=
 =?utf-8?B?d0lvaFloalZaRU42Z01VT2YwTlc3aUhyZncvNU1ndHpSQWVsckVqb3Y0L2dk?=
 =?utf-8?B?MjY5OW4wVS8rU1Jaby90aXBmZmNpTXZRQ0h1aGlSN3pTMUtDRldtMzRkdCt2?=
 =?utf-8?B?REdBZGh0S3JqY1BnbCtqb2NXbmtmaUFEOXRhRG5RdFZlbHlFcXpGOFBDdWY2?=
 =?utf-8?B?Z3ZMVGVOaDYwckdtbEJNL05BdlM3MjV4VC9DSFhNcEFpa2hVQjhDbytQVzNy?=
 =?utf-8?B?bFJPVWhSQjlnUVRxVDZaMGNhL0dGcjVpem9VZUJBdTErRmJFWTVzYkRLM2Nh?=
 =?utf-8?B?ZVU0bmFzU3JKdnRWMmdVYUFDTitvR0M3VHVLbWE0THdhOThOM3lVVWo5eEM0?=
 =?utf-8?B?RXhRZVJvN2hJNkdMek5QQUM5MGwrb1lmV3NDMzZOaFVYMmZPcXpYM3BNTnRm?=
 =?utf-8?B?dmpxdUVQYzZ1VTVFVE1hWDZqd2FjZkQycGU3eTZlZm9JaGgzM05oazhaeCtk?=
 =?utf-8?B?MzhkVXRPMllybE83aTN1cS9jUk1UUkZKSXgzUEJlL2NyZzUxUVZ6THp1OWdI?=
 =?utf-8?B?ZnN3NHQxbS91TWxhQUZvZDEwWXNseXhaTzVsYldKOGRKU3E3MmNLRFFuODA4?=
 =?utf-8?B?bVgzeUd3WUNFTTBLdWRITzlSalpFbnVpbUI0L3JSMmxvRnNzR1pNYnRZWm92?=
 =?utf-8?B?T2hXRDhEeFQwSWRVbFVHMnNoMDlmT0RsWmlmOGxSSjZkeEFTZSt5cm1EeGNJ?=
 =?utf-8?B?WmZKLzl6eUY3ei9PUmMwS0Y2WkNFaVZ5bjhjTk9UQ2hYUDRVMjFqV1V0RkRU?=
 =?utf-8?B?SCsyZmNnY0RBQzZreVZhQjl4ZXhjd0lBVStqMVU1cTlCWVBxNm8waUJVQVdH?=
 =?utf-8?B?UndEVmt1UFkzaDVoMkNrUFdvdE42SUxOcmM0VmRlamhqUE9XWnhNRTg5R1U5?=
 =?utf-8?B?YllTMnc1RWlkYm93QjdaTFE4TU14YlBvZmNNL29kaFZ1anJNTUhsK1doNVNI?=
 =?utf-8?B?WVVQS1ozaFZ1K3JSZXVUd2dSRWNVTEtOVWJLWEhyS0ZDbDVweEVVUXdOZXZW?=
 =?utf-8?B?VUZ1THVNeDlsRHdsQmsxb3FkOTU4b3k4RGJ5OFVGT1JDQjg1Zk5jd1dydERn?=
 =?utf-8?B?TE1YM0NJVFVSdkdzNVRtYjMxcUU4amJWQVo0NWd4RTVPMU9wSjlQME5HWS9X?=
 =?utf-8?B?a1NNdUhRMnZFWHhEWE15OVg2RTBzdEdWUVZCcFExbndNSlZEMTJhenVoU2I3?=
 =?utf-8?Q?cnzoWMYyip4HoFtyuV503+tLvt4iMcqNlNHYv?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a4ea14-0bab-4523-0459-08de5e7621ac
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:04:19.8701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PP76PCJFBRGMn4J0YOlF5lZjsg6Db6ujCOH8b3d/v+m25e456RX+RzOg+6RkaMEWjg+w9LCvUP3PG1+OUYTFwlFcwXJ7hdTaJgalv2q0DBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7995
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 14:04:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8768

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

