Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3E1D25031
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:06:33 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61209.1768316783589804922
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:06:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ot4EkdfD;
 spf=pass (domain: cherry.de, ip: 52.101.66.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9mikrUlunt79+p8SchUlHxadnBShcYsnzbkH0b2K/OvcLufhsWau2ZOSyGw/T5xaJ4os9Ve6y8o9pYnSkES7NgvCmbMHKnCO71uftFk3PeXMsB4H9pH9rneMqKf6+eg54lZiy9K6iq8s+gIaZlCbUxaOiF462R9JJlAfwSp1ZeLkTJa2E8YPEh378jWIKUq6e5VzOGAFv17AffHVZc1sBW/aaRLpHsLBvVVhADm6IrNJ+ntrZg3CkW8Y3862JYdbEyyHYg6s0OPIhl02/gXiDSdSzt5cUa+WyPU1oCNd5bmTW8YcOa7uUItJkvjZdimkNnOpdi/4ELlBP6m7/Juxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=Rk5YKBsrawIFcCNrGXL4ZUjV2B+krJwHkNff1SejkblW5Cyu7FCtORZaoolaGb1K2hzbd4c10q7tmd/AcX9Oc4gKJw3vtRb0WKMjLKN4XjQkmEFzKjDGg+CrXrdTfF5MFiCfiGWfPaHDdEZWPx2JiJyTsRS1vpniGSVcjVPnt5a7c8aWCl4VqwwC0+bPPyH/Hie6a/ES72wOPtHScxh3/2Wcs3qjn6sYQ2iqz/k5r/4/VOvJ0JK4N0wOrlpQyeR/ChLOkhE6VGa8EDT5Z+4v/eKUyd/rHuVZj80nn5k0PHxwtxTryT24GniTkFAgvKRgibEl/QXUnjoQSLRDKix/7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=Ot4EkdfDYdZ33dYSbN57hrNkWjCoJkG1XSWdGSW3dUjHogwHn8DPqvHh2czpgSOZJ8MUQdbQq3KLErpRwrWW/fUpptyUIHFUN1Lt9QJIwXAPvlVWhswfzltcB3kngO0CpLc8kZARzIkGX3KFsPVm1mpCKqcXUxM4ArnKN5D+QxI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB10733.eurprd04.prod.outlook.com (2603:10a6:800:266::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:06:18 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:06:18 +0000
Message-ID: <e073f848-1ca1-440a-9526-aa23022bbb80@cherry.de>
Date: Tue, 13 Jan 2026 16:06:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 41/53] dev-manual/python-development-shell.rst:
 remove obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-41-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-41-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0396.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB10733:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a2b1d4-cb54-4e52-2114-08de52b54df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OTg0bVZqOEQwSFVDSEJ1MXloeU1XL09nUzZGMURhQzV1YkJHSi9WVmNMcXVu?=
 =?utf-8?B?NXUwZ1duWmE0dWVlU0JLZ1VrRWZvbnNObUgxTUM3RC8rU1VmTWMybjU5bVEv?=
 =?utf-8?B?aDdNRkhNVkpPUmcvWVF1YUhkNnlVK2g5SDd1QUdielZmN3pSU1l4ZzJtTmZC?=
 =?utf-8?B?T3ZQRjFjUzRyeU50YVIwNVFibzl2K0V1QjRlN3ZicHZPWjF1OVE0TWk4WDJl?=
 =?utf-8?B?dDliMloxYUg2OEJacVQxR3FkbDNqV1pXN0xYRFIxdng5eGo3UGNwdS9HV1FD?=
 =?utf-8?B?MFd0bUh6NStZdDY1YzI2NGh2ZDVuODhqVEJFU1hZOVM2RSsyRkxVeTVGb0Rv?=
 =?utf-8?B?V3dlSkVRL1BIcEtaM1d5RzlKS29LMzFoeUNMWk9ZQ2RWcWhOY1FFYVZpelFl?=
 =?utf-8?B?MjM4TVoyTU5ObjlyWHczWWh4RGZUc09hN3VSRlp3Wk1UWTZTLzRlRW13bGda?=
 =?utf-8?B?VHNHYlUxWnRtMmp2S3BIcUpzUHZqVVhDbmFWRnFYNzR2ZGVLQTRlUWFFTFdn?=
 =?utf-8?B?akpwcldscUR5TlduWnROeWlYYTBaTk9uMDdTRFNSdGxQeUFuaWI4ZlVhR1Nx?=
 =?utf-8?B?bG95aGZyeU5ZaDVnVUlsdW9ualcvWUVLc0JmVTFORlg5RTlmc0wxSGhQVXJy?=
 =?utf-8?B?bTZyMTU0U3dwTjNjc1RYMkt0dk1CajV1cDF0a29kcHkwVmNhZEhUbUZzbENj?=
 =?utf-8?B?V3lYbkp4RlFEQ3AzRUd5ZWJXQTN3ZjROQUpjZHFTSWFKeExaeFFSVlJNZXlx?=
 =?utf-8?B?WnVEaUhWYklCMFV0KzkzQTBnR0JlczB4TkRocnJ1UWFEclJ3UXBiVzFWeGFy?=
 =?utf-8?B?WmFzbWhOK1dpVHJvQmc0K0NOaDdjZmY5VS9rdW8zemNOZEFvR2tPOFlDZUN5?=
 =?utf-8?B?SGo0NFRtY25ValREdzMySGxWSHhya3A3WnZTbTVNODdCYU9vekNEMmpVek0w?=
 =?utf-8?B?NDVUUDkwMXdtWEtPeEFTQ2EzV21nT2FhNHlxT1BiL3Nncm9BRzJUOExLQWdK?=
 =?utf-8?B?YTFwbzVxdm55N3hLellVYnlXbnJkQkJUT2tQOWJodWI3anJDSTJHUGo3MjRo?=
 =?utf-8?B?T2pXZWE5Vmd0eUpXa2ltczNtUTdpUWhNbEwwaGhBL2c0alU1a1VHQVMwdTBJ?=
 =?utf-8?B?bmZkSytsRktzTkk3N2JzSkZqMmRSelhQTDM0S1FrK2c4KzR2VXNFMFUvTzJq?=
 =?utf-8?B?L3NyUUl2ejA5SkM4MGRuUVpkREI3VXRlM1pUSEFyeE0zS2FUZTEzbjVtZXhI?=
 =?utf-8?B?ODJucUZ2bW4yYnR1c0F3bzlMb0wzUjdZUDU5dXh0NUw4SmlOamxpemN3elFT?=
 =?utf-8?B?MXMrSFkrdTV0aDZ1WjA2T1BOUGFjcHhJMFQyQWNYY0FLei91b0hWS0pHSi92?=
 =?utf-8?B?SURlZ3FTcXgzK3JEcCthbFhLMk4wd3VKODhFb0NSU2lpRVNjVHNNRnR1cE5P?=
 =?utf-8?B?SEF2MXBPLzFPb3V6WDlQeVpIZXQ4QjFzYjRneVZrVy8xTWdPK2YyQnNYaFdu?=
 =?utf-8?B?MHBWWFhzU045d0RGYzErZWxJVUFaaStDam4xRzlVSlo1dm5FYjVPcVBYOWpv?=
 =?utf-8?B?YVdSWDRLbi9SQjd3UTMrLy91NldreUluQXRLRWdlSHZMSWt6QkkrMzJjV0dX?=
 =?utf-8?B?R21XdUsvQVBNK0tUbzBBVHQ3NHdidTI1WVEyS09aRHBEWnJQTlhQUWRHaC9z?=
 =?utf-8?B?TG9ySktNTjBLazBjcis5am9LUngxNmpiNUorTHllNFc4S3pzak9YRnpSM21X?=
 =?utf-8?B?VDNOWDdob1duZmhhOFJHUFNkWTRFNkpqNG9rd1BGVENCSHpXY09RaVdhT3or?=
 =?utf-8?B?WDgwdk5NL1FZS1JWb0N5bTRNdzR2aElNRDJvVVdZT1ZrMFNnU2lQUXpsNHNk?=
 =?utf-8?B?R2UrOXlSTWk4WWZ1bldWdHBUV0w2Qi9ycVkwRDRRTlRMeXVtQnRWUXBDc3pR?=
 =?utf-8?Q?uEXHpV5fr2hy99ikA4zyx7vOyqO7Te+u?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHUxQVJtTzMwWVZzZVM4RU5PYVVzV08vdlZPc0ZiQ2Z6d1BtMk9LNEljNjF5?=
 =?utf-8?B?RnFvVUwzWnVONjExcWlOUHlqeGxEbHZwSk9nMWkzMWpoZllsem5kQm1EeWxF?=
 =?utf-8?B?WloyNU5PbzBRbVZNWm9HQ2piQi9KSHYzaDl3NkN3SnNmd2dRaEtwZlZrRGxV?=
 =?utf-8?B?RktMUFFGeWNsdlA4b3JNREtKeGd2cHFWdVRNM2RrekVYNUVnZGFiTWZLSEcv?=
 =?utf-8?B?d3NFeGI2ZnNvemdNa0hkWDB2LzhzZlEySW5hS2szaStTSGNEM08vSXNzZjdZ?=
 =?utf-8?B?a1BaK2JOWVFITnVVd0JmSVU5TFNoNExrRGp0UHVrcmFjQ1lOWlMrWGNncGZu?=
 =?utf-8?B?TVRMbkRlVXE3MFdVaFhWK1pqTmlpUkFkSTd0cjBvc3krT2FBUzdJYTdoaS9j?=
 =?utf-8?B?VCtueGtuSXhNMUYzZ3ZySTFFR2xDTzNNYlA3cHdDanc2THdPTFdSbjh1Nll3?=
 =?utf-8?B?Um5FN2dhZ3JkcHpBUENqUEVDUXZRZHNpWUZxb29nMVVHZ0ZoOXFqMTlKZnFi?=
 =?utf-8?B?c2xIYS90aUNvVm5uZmdkZWtDU1lIMUVNVW1wSFNtYXJTQ2k0dHZjK2I2blFS?=
 =?utf-8?B?N2VEM3FQZzJ1Q3h6cDcyZUQ4bGtqYjRIdmR0WS84dWl4MjBOU1JOMHYyWW9m?=
 =?utf-8?B?NlcrMERnVm9YTkhMeGJsMTM0OEtpVWJ3Y2lvQWU2WGo3S0NZMllYbHM0MjBk?=
 =?utf-8?B?bHdlbExhUXVQR2lYQkVPRkxZRlQya21YRU91dCtSMS9pa1FxSmVXK1BGODFM?=
 =?utf-8?B?eS9DdDN0bkdSa1B6UVR5dFdCYS9WZTY4L2NqTWpTaHJhS1p1U2tadWVFR1Nt?=
 =?utf-8?B?dzNiQTIzWUVQeE43Y2E3SnZLaXc5bVZzMFhpaUZUeU5oczM1U0lTYktkV05C?=
 =?utf-8?B?UVhaRHNYWmRQeGcwYVZaR29YS0NZUmlSZ1JYUFh0bUFyL3FqSUVIZUFqMUN1?=
 =?utf-8?B?YmdKdVhMSzFtTWtkZjkrRjVHNkxBUTR3MThNSlUxN2dkUWlWem5Iam93TFBx?=
 =?utf-8?B?UDV6Mjg0aWFERklETUFDV0RPRWxleGR6OGJ0WlFwK1JTR0JKb0ZmaFhLVlpB?=
 =?utf-8?B?ZzFPV3I2QlJyNllWc3JMcjFzd3FHM2p3cHJ2OWY5MjJneTBXRUYzWDlIaXF2?=
 =?utf-8?B?SDBxT2hZWjVJME5wUGFSVEUra2UzUFNYV21tQnU3clhHdzZ2RUNRclYrc2lC?=
 =?utf-8?B?MHczU2tsaXNNUkY3ZDR1aTE2anV4d20rT2Rza29uVytSd2hMMmFmZjVBOXNt?=
 =?utf-8?B?cllNbEVZNFBtb0ZGUnlaUVFYdGJBamlBMmZITGN1OXlDK2pvU3BxYXBwV0VP?=
 =?utf-8?B?eWF1SkpXNCsxNit3QjNteHNQTU4wbGVPZ0NwZ3JOUnlUcDNESW1FZmtEcVZk?=
 =?utf-8?B?cGwycEdNMm45S1RXZVFKTVNZZ1JVVmZjeklxK3I0YzNHbndZUzNkNzlySHBQ?=
 =?utf-8?B?UG5tVHRhNXByQVRuOC9sMWhKS1N5Nkc4N0xUdk9KSW11aSs4S3hpTUxiYjBj?=
 =?utf-8?B?bVV2eHp4VEhEZTMzOUl1UytGT256UkhLSkw3Y2lTQ2lTUnFqcDBVMXhPMDVq?=
 =?utf-8?B?TFFCbDNtTlZLV09va1BaTXRJY0JKY1c2OWI0bTJ5TUNKYUt5YTBUT1pXcnEy?=
 =?utf-8?B?MGdKZ081aE5TVzB0dVVqY0J2U1FURzl0UjZrc3dKN1QrYVh5eG0vY0h3YUhK?=
 =?utf-8?B?alErdGUyZUhsQnpNQjgySkZBQ1dWclpOMGJhenpHRVRFTFJJOXdRMFlnckoz?=
 =?utf-8?B?OXRZbXdVQis2N3E5QXpoS1I0ZkgxNi8vanViQVJiaUwwa2J3L2FQL2k4cnNt?=
 =?utf-8?B?ck1NUDl2YXpzUnMwNEtGZ0VxVkFHSlZSMlRwRHNibUpoaTBaNmNzMHBSTUxi?=
 =?utf-8?B?bTZtS3EwWTlhRCs5cUFDR1RObUVxTkFMNEV1STFLVXBEN3BOMmZhTDB5M0Q5?=
 =?utf-8?B?c2I5TThpakN3aVB6bndkdFFwRjUrL3RMdXY1aGNwUVdzOUZrMCtvajRNSE1p?=
 =?utf-8?B?cU41UkFhVmE1cmtBUUdhL0F2Uy9EdG9ZSTZpU3pBekpDa1hnOThYSTFYT3dX?=
 =?utf-8?B?TURTRm9oTFovbys5Q2FnODIzTWFIdUw3S1J2OWVKSDh6dXlCejIyUjRRb0RX?=
 =?utf-8?B?Rm1abks5UzRZRnBKbktmOVlHUmhjNzdxSzVhcjFRSXl5MExHUXNMQmRENkYr?=
 =?utf-8?B?Q0Q5OHQxYU4yaWQxUlpMQVBBcUZxNk4wblhTUDNudVRLNit4NzlEMkdCbjdo?=
 =?utf-8?B?cjM5ZE9kZWtnUzljVy9aaEZmRFBaMUhUL0hPTDRlc0N2KzZTK3NFZE5FWGg4?=
 =?utf-8?B?QzkzMXRkOWIxSll3SzAwRjdzVGNYcGNRNmtTb21PbEI1eUZwZW95dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a2b1d4-cb54-4e52-2114-08de52b54df8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:06:18.5089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWjK3aZnUEnB/vbWe0nFxY9wr6A4+3cYi6GTSgQZnwsHdtCHnocqV0rcv9UkDJgH90VdnVjiNJ1KOHsnAg05l8pXo+f7Z/YR47/gbo4myJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10733
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:06:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8530

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

