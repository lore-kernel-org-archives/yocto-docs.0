Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7386AD2F32C
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:17:53 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61146.1768317470326456576
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hloJ2lcO;
 spf=pass (domain: cherry.de, ip: 52.101.72.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKTow8ARKSxOGFbj4uyJq291qRSixnYlUnYdBd84CuWKfMqpz3nohta1tyB1Toto76eskEFS5nvhSk44JbPrkETP4TOfmFLhXUhythBr0E3oGGbx7zlLPw/hSLSRlEXou0vPriQKHtHqPcfE7egGm+eCxB0efyLoKOi+8mIqT2uSP6v40GQ++ZCjjEuLzQvWVBeBPwInpMpfMfCW0I1b+AJKrLJ76x9wcA6EiSiQbUbRtA3CLdwZq7wVRANa2bAgECEOhKXQ6HLS2CTfQNtBTTRf5vGp+h6TWMJHEhckoVTT6q1HDNAIIF8OmN+1x6A2dgjp9GeeaRmdLjQbtmVp2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=atfAv34lwVzZWDGRju+ZpUAvtVSEcHOudKajes/Vc9tQF4MlHhe3rCSnCzg8NBFvgKiiQN/XTlQbqDgoYiaXXIw1RNGLh2WmJ0X8Sjj7I5K1LRy3VoFN+oo6WUd7ukB4OK5LR32yjkEWy/V+Nq/llHNA+gNky5BmxOkdHvYqYCHAG6HUTcfyY2hbjK55R36crrfA4r3SqT0/5770YSYW754v5acVpsBN5S8zpwunHqZt+1oCmCV9n+/mSu+P3wK+9bctyNFT7kBUZnUrDmB4Kc0bgi09PqHrPLlVKSP09iZrOucWQRlIs8OpP4xQ7vEaV9nI4OnWkfDLnocHb+IatQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=hloJ2lcOybenfwsY5+V5tL7ezfFglzKg9RsCkMvxyw179neWYd3DTX500waGJYyd+QhY+GCUCbZ4jXt3XhgGtOxtlpVZnUDhqBVtkHrw6BsMNLZ0Tiit+PJzLlJilUtRTbxHAJDXstplzyBhWPJoagbaxvC3qfBCMpDZ+T9YNFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB9915.eurprd04.prod.outlook.com (2603:10a6:10:4ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:17:45 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:17:45 +0000
Message-ID: <c4bfcbce-2942-4339-9755-bc873596f986@cherry.de>
Date: Tue, 13 Jan 2026 16:17:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 47/53] ref-manual/features.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-47-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-47-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0351.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB9915:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b32fa9b-1bde-4325-fca4-08de52b6e774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eVRFdSsrOHI2c2ZiMmxqQmJvQnpGN1ViZ0lvUVhvbzZTRU9HWTVsbXd2WmJ6?=
 =?utf-8?B?aU05ZlZtMkpkQWx3TzYzTnN3NFZnL014YzlWRVRiQ3JVTW9tZmhPMmMwR2Rm?=
 =?utf-8?B?MFBCbDIvNTR1cXpYSFdwYmRLczdGdFN1TEtCQTB0UC9KSUhSODNvT2ZXc3Qx?=
 =?utf-8?B?eHRuOW9maDY3VS9ZdFlyQzBnSEEycE10UWNML0N4TEVsV09oc2lZWHNUSGJH?=
 =?utf-8?B?S3hzL09DZXhCMTE2cWliTGRVSTBFZFFOU1ZKSkw5TVhpUHNZSmIxTmFqK085?=
 =?utf-8?B?N0lIYklzN3pXMVFiaTJHc1hMRWRHRjNydGh6Yml4cVZ0ZytyUk8xSXQ2NmpQ?=
 =?utf-8?B?QnpTOE1mazlmSWNPVDdOMWNXUktLT3F4UnFvak53bmFpMXdFSTc5V21UOGtY?=
 =?utf-8?B?SmRwbzdCMXhtbnhtVzhOZUNwdHBVN244bnRNWFV1Qk9HRGw1a20zRStyZUxM?=
 =?utf-8?B?TkdvN3lFT2xzdE5SbEhDU1hMV2toTGhaSlBqd1RzRGpIWUhCQjVwMys5VUhB?=
 =?utf-8?B?OWZvRzJDZGpWdkpVdzFWcmpoeXNtUHZDUUZmcDBwTis1QkNEZFZQMVpDU3cr?=
 =?utf-8?B?UnpmT2V6RXN1U0w2ZUExY0xpTUtQUnk4bUMyYXd5bzd4V3lzc25md1ZjdTFY?=
 =?utf-8?B?Q2QremVCdFlNTU9sRDZKT2JOSHIxQ2NURitkOERLK2hoRTFaV2JSVGhaVktI?=
 =?utf-8?B?WDJYVWYwckJEbFFLMzhKSUl4THB3STRIWDhUdjNxc2tpZzNmNGxMa2g5cDRZ?=
 =?utf-8?B?ZGdiVXhHcnNQaFRJTzBoWHlXOVk2WHJDcVBVNEVJY2xycHkzZ1BTbHBCeG9a?=
 =?utf-8?B?ZnhHN09yZWJSV253TTRwWU51VnFLWTA0am9LaG9xQXdUc3JsaFF4Mksza1ZV?=
 =?utf-8?B?Zzd4akR3QldPS2tEQkszZHhoQldnd1llT3NyYkVYNjAyNVI4QWd5RGpiVFM2?=
 =?utf-8?B?eEo2T0Q3SjhOU2hWT2h0MDNDVkYzVTk1ek0yU2E4ek5OMjdDVUJIbnBwWTBJ?=
 =?utf-8?B?WmJ1RFV5V0NuYjVyNEZLUGVFSmFrNFNZUHR4MnBKOElRbG9Fa2JUbnVhWXdE?=
 =?utf-8?B?R3A1SlBsWDZHNEVKQ01kWk9wN2h2TUczRmVWZXFneThCelhxL3ZvUDd3U0JQ?=
 =?utf-8?B?N1VKTHo5VGhsVkx2WkVWc2MwYTZ0TGFzQzA3NVc5ZkdxQzFuUFZPeVl6RWM2?=
 =?utf-8?B?NDBRWHNqdjF4eDc2ZXlyUjJxZ3JRVDNLVURzVUpxaFFVblJqMjZPSUdCNmVU?=
 =?utf-8?B?K1RZcmplczBDVkJFYlh6RzdYTytLOXlYMEZNSkZFbHFhVzlZMTZCaitJeTlC?=
 =?utf-8?B?dGplTzdIMHNjVG84M1o0Q09XRUQwbDJob2RaRkc4eExwZS9XY3JKaW1UOWNY?=
 =?utf-8?B?VEsxdytPeEhVYzFIRzhOcDZGNzBzeFV6VGhETENoa3V4aU9HYUxEcGRWQ1U0?=
 =?utf-8?B?a2VjOXBVdHZVZ1NyUGEyY3hyVDBLVTJ1RzAxZktoRG9kR2ZiOUdZLy9OeGdD?=
 =?utf-8?B?Q3JRd3E2QXd6TWhvV3JXaUpwekFpQ2pDRUd1dGhLTkJYd3B5WU1yaGs4eWM3?=
 =?utf-8?B?cXN4aTVzQ3Zob3VtcmFPWCtWUHdNRDJ4Q3lvbHlaMk1Ta1ZRWU4wM2pyRUJn?=
 =?utf-8?B?eDVSbk9hZDI5U3ppMzkyb0RJSU45VTdvRk9Lc3BYL0NBYUVqUWgvUzR5MCt6?=
 =?utf-8?B?bFZvMzhJUnJISlBRdkFJeTVSbGRaT29pRjJyTzVSSDY1YnVzYkpxQ1FlM1JI?=
 =?utf-8?B?cENCc3ZCWEtTUHpQNHY5UENQVzNLdGsxMVF2MmpZbGFpYWtLNHQzSWtiSWgx?=
 =?utf-8?B?WDRhU0JNSzlaVHJqRnRaVzlKa1A3eUJCYXZDUmlLbEtrODZvS01Mc3JOVGxs?=
 =?utf-8?B?a2xkeENXQUR5UnN3NjZ5VVoyT1pua3NsaFhRcHBhUFo2OFd6L1lqOW1Dakdy?=
 =?utf-8?Q?ZIYwBp/cTD2l1fN8UONnuQWytWCMTfEl?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UkdmMkxjd1JFdUdmYlZPa2JSYXRIemh6UUovV05ZS2FaaEV0YmNiYWd2T0tq?=
 =?utf-8?B?VHRHbXNwUncyVHNROHQrNjc1aUVLQytJdlBBODFWb1FCWUdvRmlhSWpQMU45?=
 =?utf-8?B?SUJ0L1YxOXJoNEd1UjR0MGoxbE1RYTREREYyZ2c0K1RwQVlOQlVYYWZSUTVj?=
 =?utf-8?B?OTRPMzR1bVVHaytUaTdFSmhIcTBhSUpLREYxRjNqMUd4ai9KRTlRVVc3WlpB?=
 =?utf-8?B?RmdtWTVxWjNLMFJkOXFDSXA2Y2wxc3hERS9Ba0N4cXFJRVdFb2RET1dvenN5?=
 =?utf-8?B?TGpsaTJuNno4L3dKZ00yY1d2Q05TdVJ3T1lHL2tBaWNUWVl3MzJueTNabTBW?=
 =?utf-8?B?MGtDcjR2N3prUlBNa0wyakdyM0tvREptdjhCWDlMY2FLVnlaU2FFTUt4MGQ5?=
 =?utf-8?B?ckFBcHViTFFiU3RKenBFcmJJWE9peld5VktMY0xBdW1sbERPa0gxUHUvUmRv?=
 =?utf-8?B?djE1SExyeGIzVi9qMS9ZY3NhQk1tUkVndy9BcnZLdkhZaGNVVjBOcDFwVjRK?=
 =?utf-8?B?cGMvL0l5SEVtd2E0QmR2b25HRkRxWnpVMzBoL29HWDJISmdoc1NSNWcxbVpw?=
 =?utf-8?B?bzZaWHp4VWlFSmVwUEN0aWRxUVBJcWhRQ1NLL1hEYzVsNkxRaGh2YnY0Zloz?=
 =?utf-8?B?Q25vOUswV3M1N0ZPN1JvMXhKWE5VOFg3TkQ5T0lheFQ2SUQwcEVLalpBUFdW?=
 =?utf-8?B?cXd2b1gvcHVqcnEyT2tua0dlZ1U0OWl0ekQrYlV4YUR5NXJBTkRZNjRtYkFC?=
 =?utf-8?B?YUxGSzl6VGVNWWh2ZmNjbjY0aCtxSGVsUTJCcm42Z1hNemNXVmU3Mng0RUVW?=
 =?utf-8?B?bUVEdm9hcEcvNmMxdm81WDdKbkF1VzlZQ0RSY2N3bG5qSVY4bmVqUnFwcTFl?=
 =?utf-8?B?NUJ0aVBMWnpIbE5TUjcrSHFCVlNBWG8zZ1p3WkhKdUZtcmJaQzBXZ21rSHNr?=
 =?utf-8?B?YWVzREIvYUhLYUgwL2o1UGNLMzIzRjgwZTV5ekoxWFNOREIyK0NCdk9NUnVD?=
 =?utf-8?B?L1JUQXp6ZGZWT2I4ZGc5bVIvUDZyYlhzQkRvaThkdDMxMjhkYVZvOThCTU1K?=
 =?utf-8?B?N0tkZitmeklObDY4UUxBL1BJRExBK2paRjdYeCtvZ08ra1FUR2xiMmtUNUJP?=
 =?utf-8?B?UjdzNWNwY2FEa3c1UnMyMGlCVGRvNXkvNXdlbzl1ZGdRZHhoYUVsMGhuUlpV?=
 =?utf-8?B?cVdSTHdUOGdJSFprVFFYOGZjMFRBbTFYNCtHdDJzUzJlM1I4aStzVEFXck1O?=
 =?utf-8?B?VFNyckMrWG5ydHdjbmtmY2U0LzJjUGlFSy92d2FxY25laE94V25DTDdtWmFm?=
 =?utf-8?B?aGdEVncwSVJWK0pIZExvRUVKejRQVE9heksrUTB1bFJ3MmxxZXkrblA4MS83?=
 =?utf-8?B?U09mZnh4UWVmeDBqelZCZW5uZHFTaWJGNVY0N1pJYTAyanlQY09yTGFlcUhz?=
 =?utf-8?B?TVFNenBPWmszcTBzNjdUMHlxMmxDYnhuNDFSK0ozZDM3c2d1VkZWNUZyS2dV?=
 =?utf-8?B?d3cvYm42TkMxQUp6UFJQazhER1JXOHlKOVFieGZGRlZMYkpWcW5MUW5jb2xQ?=
 =?utf-8?B?Uk1qMnY4aXZmYVZJRUhibFMyNEtEWVpKZzdoSkZDOW5qd0VJOUdUZ091am1o?=
 =?utf-8?B?NllmOXBSUG13SDVzcUExVForbnBxWFFnSnBCRHRkYmFoMXdZeXI4czBHZS8r?=
 =?utf-8?B?cmhrb1M1RFRPa2JMamFqYUswZEJEM00xQThmSEFVN3h3TW1MbytKTFBhVGlj?=
 =?utf-8?B?V3pndmVtY3JxeUIwTWFlZ0pKbU9kNldXOWdFMndENUNNbS9IenFQdElHV2R2?=
 =?utf-8?B?OHI2MnNWSmxFUE40UXczbERWY3NnNFFUYVY3NVZjbk85V1VDdkZDUVIyMjU4?=
 =?utf-8?B?NVplWU5lV0d1cWg5QjA1azJReStERlFUTVc1UWYxOTZjY0lzZmswZzRXbTRQ?=
 =?utf-8?B?OE8zSUV4clF2aElCTmhpM3Y1QlI0dEJlU1ZhdE9sTGUxYVhWQTdteW1xZUth?=
 =?utf-8?B?ajVhOHJpNndhZ21tRTZWL0RXZFJKQWMwQndydEZyN3FSZzN4a3Jma0dHV2RE?=
 =?utf-8?B?ZnRWd2NkZWxXcHlwWmlmUXF4cEZoTHBNR1hqRXNZRnFCeml3K0xmTHdmdTVi?=
 =?utf-8?B?aE1xa3JCQmpTWHhUcUdPd2gxRHhoblcrdGtROVRpK3Vlb2JlZC9qOXVvejZ5?=
 =?utf-8?B?cnhCY0puelVoa25PVE5YUlB5bG43SHh1eHpPYUNUY0t0bmhQT29QUkNCUlNr?=
 =?utf-8?B?QTBNRTM4VXRNcGtmd09EV3FWZ3VYZlJ6V3VFc1dKUEpwZ2liNkJxeFdjcXlR?=
 =?utf-8?B?ZzJSZE5VWXAyQ1BkNzRZSkNsYnVERW54VWplZU1KWDlIQllLblZpdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b32fa9b-1bde-4325-fca4-08de52b6e774
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:17:45.5329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEk+2s3le5LBPqyUggO492T7cnUpYv/S6vLHfmkLkePNpH6tJCPskysAXqOx7VV5ZWp58rbUELaQipBWbBRzuYK9Wkn+RGroTxJcpvT5ROg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9915
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:17:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8536

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

