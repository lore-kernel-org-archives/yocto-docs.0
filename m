Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D168BD4115F
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:15:22 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32373.1768472120448576789
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 02:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XWeM1pCY;
 spf=pass (domain: cherry.de, ip: 40.107.130.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3+Zj7+kHuZex02ciHLg2YyM7s+URECnIetRCjV1KEleSQp+sScIISBdp9/eAALnrNUi7PTGbU+YQkJJJKaDtA/Tt2oRDA3GAMydfxPRhSf9o3nihltCDGMiVfjOuiFmA0eobr1V61342zzC+Z8/XGk6Zc+2yMFK4VFb+HR4Pr54snK2/oPzYbXOJfWHeuaSfqR7F+yBrCWTj1YB1CXEpn+dgGMH95pl/nk4VxF12faq+SwAJSVwSPy/bnwlG44iSEkJH3gHegTaDZe8oZzav2BGEUt2gIxzlmU85EvHYcbwm7YCqQp1tl2ApUCcXQMgg38ZbVXtg2uIk6Rb3gaO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtuYdbTa7nIhGJM0XgoZgQOJC/vBD8zfgZZCu9aFyyA=;
 b=W5LH6RMuIwxcuUWVmAvf3JhmihipPpcpTuicD+Plzeg6kAGkZhGjTwX4cHvbwlPb4jcDyihWRyvvZY9kosdTug2ImJSmuqxNkLaFQF2FApyZ+bpH6bBw0/ixfPYVBeIXNYIb8mlvSYJa4vHCQz7518uwjT70sAaxy3jbZ45RJJYz0WqBTTrsqH6RPfcfjlcDeZLeWLYAWYKFW2fSN7oxCNC/diUgJUKwXynIOqvv7+n8Eu1TMVZF2t8Hgm5HArQqcAfGw0Mb0Fbmdci7YCVmjXvHqP2we6HgdggfF2Kjnm7pVufrUdyocDqCWHxWENUzoQ4c8noS6FBpdgCXM7/oiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtuYdbTa7nIhGJM0XgoZgQOJC/vBD8zfgZZCu9aFyyA=;
 b=XWeM1pCYO/2SBjfYWeuejI34SwTkF8dIliaWcVpf4UywlTXyxhmz1LBL1TOP9Up++NwKSqZ3iV40hPdFNfYtyy2AKsli0Rl/aQuliQ8g/n0eMj7FJt5zISqQv70QrBpDcX6Up5RNrUULvogHptT+ltavqVzbX710CBGa0eodSeg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV2PR04MB11568.eurprd04.prod.outlook.com (2603:10a6:150:2cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 10:15:14 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 10:15:14 +0000
Message-ID: <efd00670-b610-4a52-bd4e-62fc0aced457@cherry.de>
Date: Thu, 15 Jan 2026 11:15:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/5] ref-manual/terms.rst: refresh the
 OpenEmbedded-Core definition
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
 <20251224-terms-refresh-v1-2-691329fd038f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-terms-refresh-v1-2-691329fd038f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV2PR04MB11568:EE_
X-MS-Office365-Filtering-Correlation-Id: 98455eba-886e-44ed-112e-08de541ef982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QTB0R0k3VWEzNXNQWllTSmFXZUVUc0xhWW40eWc2eFNzMm1tOURPWHJWYlZF?=
 =?utf-8?B?MTJXSVYvZWlubWF0VUwxMDA0V1R2RkJwUmFiejB3aXowQ3RFcXNjcktDbEhH?=
 =?utf-8?B?eXhqWkJhLy9xUGFYNTlHVHZQY3U2ZTVzOWZBZ0lteEI5dkJ4Q2RuSWtGancv?=
 =?utf-8?B?VEpmYkROKzE1SVZwUWdjbXJndUdCcjhmU0xhQ1g4blRNUkRsSy9JRnh3bWpX?=
 =?utf-8?B?UnhlVkFiaGRZc1FFNnVmb1BWZXVDVjRsUDFQQXAzMWpQT1piRzVyWktTNnh0?=
 =?utf-8?B?K1RVTWRHNElMZGJtSnB1enRrV2pIVGhLZXJ1ckZIdUJ0TXlVUU11dGcyZ1lt?=
 =?utf-8?B?OVdRZDlhcjM0Y0NZMkp1RG1KcU82MzYzQWxHRkFSMWgvcUxWcTZNQktxRHV3?=
 =?utf-8?B?RWQ5SmVhdmJHVGZyYi93K0NyNUdmRmxPbG9RRTZXOHZqcnl4V05uclBBZ08y?=
 =?utf-8?B?bmxtSFhmcHBzWDZzdHVRVUNwRUFQZVl0alYrSytQNGgvVnY3WmNXVjZjL1c1?=
 =?utf-8?B?eG9iem9kTjE1bG5FcW9ibjBHeFMrU1A3QTU2R3dXTFRlbTgxU2pzZ1JHK0FU?=
 =?utf-8?B?NlAxZW9OMWw5U045Q0NQa1RnTHI0YUxmRGRBVk9CajA3dkdycHBrWkE4Q0dS?=
 =?utf-8?B?QWMxYXI2NHpYVUdEeWF1YjFVS1hQWkMzbk5EUHB1N2N0MDEyME53SXJ2Uysv?=
 =?utf-8?B?U25MbUZMc0xJZ0RmeDFKUEJwbEZldXBidXBSbXNpeUpLVWswSGpacUFrekd5?=
 =?utf-8?B?eUtUQmR1SXBSRER0eTYwM3VoM3dVNHR0NWJnc2Y5b1NzdFllZlBoRVVvNXph?=
 =?utf-8?B?aTJUUGhKL0hGZVU1QklTb2hwUUZwbGxicDB2eHQrY2NHYmVUZFdMSFdvS1p6?=
 =?utf-8?B?WlJDMDljalVjSHhlZWVOcGQxQkNkM0hJMlpJTHZTYXVOTktCVTVrUXRhbnFT?=
 =?utf-8?B?YnNoeFdiYjRLa1Bxbi96R1ZWK2dDdzdsVXBlT0lmUVc5SXpwS1Y1aHQybDNV?=
 =?utf-8?B?U3V4K051bFVuT2huRVhMTDJvdWZnZzlNQzBWT0Y4VzZCcEpRbHNZMzhXVWg5?=
 =?utf-8?B?NHpHZmlnV3FLU1M5UEgrZ3dKSlNGbGNuZjFkV09vcTloSUpPQWFDdTVwYjhx?=
 =?utf-8?B?d1FMY3FHU0s4aVZBMFJkV2xhSUNhZUZMeGJZeE9xdHZNM1ExN3lZTXBpTUJL?=
 =?utf-8?B?MWNrdFR3NHJEcTlsY3dZK01RdGhsbXVreHAya2lqdmZ0NGxSZGpEM1huMDVB?=
 =?utf-8?B?L3RPRFZaZENjRWZPcUllYTNGU2toZWNiQkFKVk1nRmRHQTBOcmZYVjJ5N3Rv?=
 =?utf-8?B?dnpGUlNWQ0JLWWFyV1hOeTNKOXB6NXpsUmNqc3lzQnYyVk1JcFVKL2N6UWYz?=
 =?utf-8?B?bzlBQVBjUDk4cGllZEZwY2x3YWtVQ3JybVpXZS9ZQkRma3p2cDYxSVhGNmR4?=
 =?utf-8?B?QUdaak16ZW8rTldBYnY1RHpoc2xWcDVselR3UGJ5bVRwd1JwS0xNY3Bwc0Vx?=
 =?utf-8?B?ZWNsUVh5dHh0dURYYUhGWWZWNGZrMklXR09Nd0FSNkMrZUpidEROSkhLY05s?=
 =?utf-8?B?WXhCYWRZTWN2ZVZsRVpsL2t2ZEtpelo4ZkxvUjFtZGdCaXNUWUpnV2hlQjRK?=
 =?utf-8?B?aWlHYzA0TVpyY2sxOXlTenNBRTlyVmFtR3JZd2pJRGxTZzdpOWRYTFJYc3Vj?=
 =?utf-8?B?Z015S1F0TUZ5NzhxTFV3eUEzOWoxVGg5cGk1eE9seGYySW1GMkhVZUlIaFVC?=
 =?utf-8?B?a1kwRUtXNnlnL0M5UDJXOVRtSlVPQlYrMytIRDdWVUJIZHFJNTkzUENpSFZY?=
 =?utf-8?B?eE5RL0ZrdEF6dTJJcTFFS1VRSFJleFpDSDdTWWcvZ1hVVDV6VHAxOWhacG9I?=
 =?utf-8?B?NW5UaFY0eEJWMHRSNFFuTy9QelhTVFoxay8wZW9EenYwbUZ3M0I3NFlwL3dl?=
 =?utf-8?B?NFJ5Sk5QdFRzMGJoWTBLUDNuUXlhall2UUo1WDVneFExRzBiT3dPMkN2QWN1?=
 =?utf-8?B?dEdOMmdBc0pyWmNUK3cwVHhkSHhEek5nYUNkKzNOK2thQy9kbVRSVWk1NGlD?=
 =?utf-8?B?ZEpwcGl0YTg3ajg4T01MTnBzRko0OEE3TG5MMGM2ZCtlU21GWmZaS3ZsZ1or?=
 =?utf-8?Q?19m4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UXl1ZFlTaXJzY2xNVDdFZ3p4cjJtd2tQOGZObUFCczVGandiZzR3MjN1YmZi?=
 =?utf-8?B?dTFoWlhDemlxZXNRdWJ0TW1OOU5JUXBlcFA2Si9TTzVqU0ZocVJkMm9FMjdM?=
 =?utf-8?B?Z1Z5S092bFlYclZYRmxPdDM0S1NWMnFBeG1YbVQ2MTFPTkJBSThCWTJnUGxl?=
 =?utf-8?B?cGFRMXhDWlRMUmQxUGROMVhxNnlFR3dZR2U0R1p0UGpUT0pCTG5hL3JmanpG?=
 =?utf-8?B?N3hyQVdZdDdJbmUxRTkrN0NKbEk4MEhVZS9lZjlsbXczdTJIZ3FDc2NTa0JQ?=
 =?utf-8?B?MW9jM1VUM0JXblhSU3k3WjJSdnlDL2hkcENUV0Z6V21rc1NXS2R5R2FTMS9D?=
 =?utf-8?B?WUU0eWl5dzUvNjg4UmUzdklCWmhsRFk2VlBzVERmQ0FGZ2hVaVY4Q3NEVmVU?=
 =?utf-8?B?ajlaSjdFMFpYUm5WQk5UbURFK1c5aWVsQ0lFM0VndCtzVTE1SkRMZ1pGTnVD?=
 =?utf-8?B?dE80c0lYYjVPc1grY3dJZnNCUGpFVXU1WDFBNFJiQTJCZUVqUnAwaTE1TVJQ?=
 =?utf-8?B?MFZwYThUcG1GT0F6R3ZLODVRenR5NjlhT3pobGZaa2o1VVI5clFCMER0VXNE?=
 =?utf-8?B?WUYxYnFMaGlRdzYybm1qZERSakxleVV3RlBqSVJYLzU3NXcvYnBlNlRRVXBk?=
 =?utf-8?B?TVA3VHkyS0Vlam9ZcnNFQ0ZvWGxUN2d4c0dzdEwzZThnemJ0UWJReUdvMzAx?=
 =?utf-8?B?SlVtNmhmbE9tcWFOWjFPelI5ZmVJMWNZR25LOUJLTVlGckUyMEp4Mm1ZYnJO?=
 =?utf-8?B?VGVkZTFoaFZ6d0lFTFAzYStkUldvQnZqanNxSjhleGVRTERzczlKdlFkYlc3?=
 =?utf-8?B?MG93dUJtSWh4dUlzMmwwSHkzNXdRaktJeG54dDRwZkJGdU0wWCtqb09GajFy?=
 =?utf-8?B?elRYQzNGVHRURFBhOU9aTSt1QzBSUWR0RzloUVVvZnFlMHB1V2drd2tzM3Js?=
 =?utf-8?B?TFhHdHNyR2xXWjUwUzZhdTd6QzJaaFU5M1JrZlpLUVlRTU9kM1BSYVFzZU0v?=
 =?utf-8?B?bHhvaThoNERNWktaNk1nSUFPc2srUDI2N1djSWlhbElqdVBSSXhOdEEzWnhZ?=
 =?utf-8?B?a2FnZDVCNWFndkZqMC9yaksyN1E4cnlGTENoRVd3cWJ0NERkcUpWNWZFdm5N?=
 =?utf-8?B?MzdBTXRPb1dUK3dXeW1naU14T0NTR3BqUU1rSE1QcnlSdURXMUlKTUUwRG1o?=
 =?utf-8?B?cjhmaUN1QnNWNDA5cmxCYzJtTkJXMWszMjVlVURleDNzdXhOL3A2dWJzQTZQ?=
 =?utf-8?B?eWI2Qms1SW5xRXNleFhpN2FnMWJYOHAvblNnQkNSQmJxRzVScWdUUW80RXo5?=
 =?utf-8?B?M2dpQ1hxY0RBRDhUbUdPVS92Mjh6TmJLYkhuRHZidkRIUGxiMWxOMXF2enZy?=
 =?utf-8?B?cEk2dFIwVlJHQjJERjNtdnB5MnEvQTZ5T3UxUGZ5cDkzSGt2Y2pyL3RnTVd6?=
 =?utf-8?B?Mm1DM09ieTJzY0FKRm05S0IrR042dTV3QVB3RWhxeHByT0VJcWZENXExZ1RF?=
 =?utf-8?B?b01SdFArdXpzZ0g2YVBxWDN5L3FHcjZ5TVBNSk4wRER6WmVJbStKaWZxdjBl?=
 =?utf-8?B?RDNPczJ4OHIzWnZLVTZ3S0lnTjRGRktUaFVVV2pVckMzWjlyaHJYOFFtc0Nm?=
 =?utf-8?B?WUw4dUtKNEloOWVGQzh5SzREUm5xSGNzOE1yVDdUMGJEaFZ5eVFmem5pWHhw?=
 =?utf-8?B?VHkzaktIM2ZFMDJuNjFDbXhBZ0FROE5ZVXBrbXMzY3JSVFdydnNIcnZWbDVV?=
 =?utf-8?B?L01tVHhaRFNDZ2Q4TGhtS3E2cGtCRCtqTlVEUmU5NzA0NFZzdTBwaThkOWxU?=
 =?utf-8?B?R2ozbzM2YXE3enF5bklUY3o4VHlMWHBFQzM0cTVMa2VvbDFBejJ2MVdoM2J1?=
 =?utf-8?B?WVFPSHNpNnZ0ZTI0NEw3WWJnNkJCVDVzeHlmZm42ajNadWY2bWYxS0VvakFV?=
 =?utf-8?B?ZTBoZkIyNFZ6T1lrM0pwaWpQSnBJSXJEa1NkUTdmaG55MUVJMFlRdDNzTjd6?=
 =?utf-8?B?VktJU2FIMmN6NVcvc2NSN2VWV203NEoyQWgvc0dVaWhWN2RzM3pFVFAweXZl?=
 =?utf-8?B?MmtHOTU3N1I3aUpGOXVuSjF2U1FYdjY1U0ZrVkxScG5pSlVuejQ3NzN5NDhm?=
 =?utf-8?B?RmtoOXErdFNKQ0Y5Z0NhZ1RWcmdlZ1l4eU9KZ1ZHZWFBVHpKUTdEOC9DRzJC?=
 =?utf-8?B?aTNISHlQSmJoYmhoNlJnYUp4cEFHcVUvTENpOTNtbVI1eGJzUmREckl6YVNm?=
 =?utf-8?B?M3JHZDhoYWl2OUZZQ1h5TVRwUlRHa0dmSnJhd3M5N1E4WkhOMmEwNGpiZnRN?=
 =?utf-8?B?N0NPUmNkbW5zcVZMaUFXUnFIWCs5b3c0YWE0R1J4WHdydmNqcUVXdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 98455eba-886e-44ed-112e-08de541ef982
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:15:14.6418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJMasNVKurcvy4cup0VvMQ0dHSa+NHMngZXAloSHDJ4zDIatciBz1K7HeZM1csbBIiDG18P5qyHzvugOFExRXY0Vgw4p8xhWrr87ibBRrtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11568
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Jan 2026 10:15:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8569

Hi Antonin,

On 12/24/25 5:24 PM, Antonin Godard via lists.yoctoproject.org wrote:
> After the Poky repository obsolescence, refresh the OpenEmbedded-Core
> definition.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

