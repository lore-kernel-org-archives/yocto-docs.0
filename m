Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838CED3F07D
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 15:08:43 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15532.1769612916130464697
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 07:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NkIM9UIG;
 spf=pass (domain: cherry.de, ip: 52.101.72.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=woxfglb2OLasppC+p7J2/w6Ij9blYLpim5DJdB+JC+qGigG9xu8auYgQwT1ww/wGhxwuJGSGAtnqL1ImytxtHKkra9+/qfEuFmJiSZRVSxdODwY7Pf0IT2mvGBuW2TLoSLRHOXjZep763l5vYK8nellQKQITCelo0CBjpgzix4ODEiR6Cbnu2VIsxmpCC1py0fP8TJKhXKoXK2RC4A30kmRKWsdQgldfoJBuIQChc8R16QW9Qy9Cb+2S2BwCwxCI0VJ1Fyl48zRsqErEZSiVU7EVPOW40QyDGd4apQ0ZrXRBdhP88KO8A+z/lHW9fbk7YAq9NWmLtbyWc7G2NlvpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=sfdWqsDhhT4VeaKkPfJHpXFYPMKD46NOeTo9nYmxF/KxabAiWnCTcWU0aulkaqwD8L7zJICZBc6YuemdIEv9PDcVY6aOReocGyplRqCwEGnddX15aYxQMs/KSk78cz4qNXyGdiiGWy0/mhwcCcS9x1nR1lH5ehfogavo6RmH0rY+oc/yZYqwA2jPAvsozqcQX/0olfQmuGMqD1GATN8I0Q404lyZInHLLWLbFWWat6SPSVuvE1Q2IIHd/kyS3+wa2JefR5A1q9UfE4ujshCdeBZnY1b+WypjMED5j3pL6kyyaJWZ+RPfpKe404CEa+WEl4kbj73wOgHCSDw2XR6x5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=NkIM9UIGXTjaeA5SAWou0WM+VSkURZtZbgmPj/T8Qhy7lNSv/DKp9OoMEGWxT2hg9DOuS6Ms+kXKJeBywQtRIVGe1rpGuotkP+2X9WkrS7y2cPbkoIyF2QijGK5dKgxru8kdCLv9BvR6vjLLuVhsbftbiiryrIayxf1GaMbST/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8351.eurprd04.prod.outlook.com (2603:10a6:102:1c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Wed, 28 Jan
 2026 15:08:32 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 15:08:32 +0000
Message-ID: <2895ff19-5175-4b4c-a0f0-3cd84fe73e56@cherry.de>
Date: Wed, 28 Jan 2026 16:08:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 56/56] what-i-wish-id-known.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-56-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-56-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c46851-2dbe-42b5-b6bd-08de5e7f19c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SURiMzF2ejBMbkt6Z1B6eVd2RTZ6ZkZZRHM2ZEFyVFpWcGI5M2RBWmUyaUY1?=
 =?utf-8?B?d1V4UjFoTG1SdnczcGx3VVVMZnlxaUtXM3ZndkV1cnZMYUk1dUFPNjZyMm1v?=
 =?utf-8?B?aHhkK3IxdFpnY2hqUlVDcEtDT1FiVnJlVjFDNXZqUHUzZkFEelhENWI5V1cy?=
 =?utf-8?B?VU1jd1U5dWd0VTUxSlhFbGZtTXpKblNjeGRXOFdWdUVPcjdIaDZHa2U3Zk9X?=
 =?utf-8?B?WGhNVTgwd0JUdGhmUmRHWkVZeXI5L1BybWU3YjFLeUlMOE1HMitDVWw1N0xs?=
 =?utf-8?B?TUpNNHRzWUlZT0p2Qzdpd05RWFBBdnlnaDZyM1V0UXVFU0RPcXhoenNnOUZL?=
 =?utf-8?B?QlJRT0xVTWxHT3lhemo2RDg2RDZKME55QjFYckI4RHNQYi9kMi9RazgrZ0o5?=
 =?utf-8?B?ajFPeDdIMmpqaGpuVndwK2Fra3VqOXU5Mm4vSmRyS1VTdHdkaktUUjlDMita?=
 =?utf-8?B?dzJ4bFJrbDFoem9IUzNTb0U0RzNYWUI5QU5RRCtwUVo2YzZTVjRqd0pjVkp4?=
 =?utf-8?B?MUNXVERndGQ1NTRJTlEwZ0krTXdCVjRyUnJHWWJ4UHg3KzNNL1F1eWx5OFpX?=
 =?utf-8?B?NkZUZ0xvT3B1TDd0dFYvdVJpcmw2RnUrVzBoNU9YdU9wUUZJWW84eEdvYktF?=
 =?utf-8?B?TU9XTjVndENOUXV1d1kzZWV0WEJUUGpibmRpMlBpQVJIcStmbnRLaW5vMWk0?=
 =?utf-8?B?Z25ZR3NFZVlEbTZBL0lxbEM3MlpEdEFsQzEvbGRyL2pLN25nY1RBUjJEcitz?=
 =?utf-8?B?ZDE0R2IwN0pHbElRa1lzVUF5d1A0Qkc0RmNVYmdML1Z1QUE2OTNDUXhWLzVl?=
 =?utf-8?B?WjYwYm1waWN2SjdJNVV6ejVyK1RZaUVDSjFQSzdRYWFRV2lsV2drUHFyeFVa?=
 =?utf-8?B?N2NNVUVLSkpJNmxtWUEycHBUZkxLa0FtOXpwcnIvYk1GSDVqRlhLa3VuTnBj?=
 =?utf-8?B?MXU0SVdjYXFtVElNaSttaC9EUWRqQjIzRW5SYk9qS2tzV3R6YnBkSVBhK1dN?=
 =?utf-8?B?ZDVCd25Vb0R0cklPYlhWZXBpbUxWVUcxYlBaU1ZxV2djRUEwTTdKUURIRVFX?=
 =?utf-8?B?bGczajNXOHRlNHVxL0tTTWpWK3JlQ2tzTVR6UFZWbDN6T3dRR3daUlI5d2lK?=
 =?utf-8?B?T25sRnE1VUM1YkcwQnRXMENSd3hmS2psOEJlcTllWTBpc3lJWXBndER3YjFk?=
 =?utf-8?B?OVF6Q1l3NWlUQkx1L01kZWxaUmoyNEdKTElSTWFFNXBiZGZWdk10enBKUHha?=
 =?utf-8?B?Z3NxQnUyS2JNVHdabWNkZldGSjB2L0tZQzVJQnFHMGV4cVJsUlhxdTdzMita?=
 =?utf-8?B?RzV0L2dVVzdoRWZaYnpWNm90NjRRZHhRWnBwaUVHN2M5V2lnem9Scm5ZK0V4?=
 =?utf-8?B?QnVNdTRHY05XcU5JYUY5UjgrQjBmbkI5Ty9FVXZIZ2FSdHVOWnJLZjYwS1ht?=
 =?utf-8?B?MjhCRmhsTENJZWt2TGVHRkVPenU5RWhOKzNUbE9LUjQwSzhsS2RlZG9pN1Bw?=
 =?utf-8?B?bjBzanBQblZVQmRZNHViZEhZTDVjd1RmcWRCeDFoc3pqa2hybmI3YTBBL1g1?=
 =?utf-8?B?MDZqMVNjL0cxdXM3amQxMnFlcVFxZE00WFdPUyt2c0tWdnQ5OGpWZ1FJUGMw?=
 =?utf-8?B?bE5ZZktBMDJuLzFvQUlmRlI2NUlQQWx3Z3l1N1NlN1hzVVdlT2VxTXF4ZmJY?=
 =?utf-8?B?VG4rVXEzTzZVazFocVF4K0pHaHF0bTUwWFpLTTIxZ1VzQXFHY1RyK1pKWHV4?=
 =?utf-8?B?ampFTjhsQ1YyVGxMcUVTU012VmFDZ1NWaXQzV0VzREFFSW41ZCtENGNLR3NM?=
 =?utf-8?B?YUx3YU10SWtWS0xzM3dDSWFyVVlqV3ArL054eExBVm13S1RZbVQ2UEZ4cys3?=
 =?utf-8?B?bkIxY3l4Y010SHlvQldTUEs4NXZ3RCtBRHp1QlVKQ21rcWcxenA3TzNNdnNx?=
 =?utf-8?B?WVVyZHJmOFRiMXZVdXMxa3VoNExUaHBFTkdEZnJUMlVGUDVtT2VrYzhXb1ZU?=
 =?utf-8?B?WTNwdXBwWUZQajRlWi94VnpMTVNQOGhuTEYyWUxzUzhDT0xMUG8rYzJ3b2Vi?=
 =?utf-8?B?eEc4L1pZLzQvcjVJZEE3T255THl4QzlybURjRkVQUjBRNGt3enRzZ1A5aitW?=
 =?utf-8?Q?170s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MWtLQy84M1M2Y0oxT2RndUlMcEFUR3FNYkJ2RFFKN0NjakJlZzRSV00yZGVy?=
 =?utf-8?B?YlJYakQrOG9nVkFXYXJaSGZaUWViYmlOZC90ait4OGFZSG04SlZMVFhYWGFW?=
 =?utf-8?B?MjVJK2NaVzdhVWtsY2lsdEVyTU96azl5TkpjRUhjRXNCSkQ3RGtSQ1dZN1Nj?=
 =?utf-8?B?a2J6Wk1LM0tsZ0ZwT1l2UjNWYVFmMVg2eVVvbkVFdlRnWFRjZjJiS2VkTTNv?=
 =?utf-8?B?QVltdHdkOWw5amFtSEhQVmNxSXNtdzVHTEF5enlaWXdkZE40UXJ2RDV5YnE1?=
 =?utf-8?B?a2RVZGZOL2I2Y21nSG5Zc1dpbXAydkZmM3dHeW90dDRGMDV0N3luNnpLazJv?=
 =?utf-8?B?SzBib1Fwb2tiSUE1RDZGQ05KclQ2ZWJhSmZnUGoxd0FrcTM3Q2tEVVZYNDJl?=
 =?utf-8?B?NEQ2SmpkWEIwVnZ3R0FBaFEzam13QmNyQUJrakpQN2lEcTh3OVNCV3VEcHRB?=
 =?utf-8?B?RmVDNnZ6amNtZEFCQTQvRmt2TEpXZ05wME5CUVdteFl0UlhxZTloR0xOQVg4?=
 =?utf-8?B?L0MwYnhMMEhxRTVTdjRqcHhiOTN5WWdWSDNqdHZ3aTVXcXlGdC8yeTRibXpu?=
 =?utf-8?B?SFZ5OFc0c21SRUV0TG5UTUJZQ0g3dDFvQTVITUl0RmRwcXB4T3lJWUtlL3RR?=
 =?utf-8?B?Si9jclJKbVo3dTBYNkUyQ1RZRUJWRTdXZUNKa2JvV3VYOFRNUFV2UFNyeGVu?=
 =?utf-8?B?TGlNRk91cXo2SytZRDRJVlJreWVuby9KeWo1SjZuMVZjaTJKcmVTdzRJemJp?=
 =?utf-8?B?NWlQYndYRlBoQWxVdUVsOUppWDk4ZnY5U0IyaGZFOFFTaSswZ3ZNK2VKT3p5?=
 =?utf-8?B?Qm1qaGIvZ0o2cElEQ1EwS3BaZmJvL1MvZ3hoUUphaHRyWXZVWWgwWjg2c1h3?=
 =?utf-8?B?UDU3OXgrVDQzNWE4cWEzdnRPdUcrcmpsb3lBWjZqOGNubXMvN3VidkFxZ0RT?=
 =?utf-8?B?MTVVaTAvMzRUSk9TYzFvbXlvc09pZjJyOXFycUZUMXdwdHF0YmYxS1JrSTJs?=
 =?utf-8?B?emxIbTNYMjJvdmh2T2ZnRU5JK1ROalF1K3VPZUFmK2tPWjltMkVsZmZCWEt1?=
 =?utf-8?B?OU5aMENBVWNORVZ5MUNiWkVvVkUwcXRFQzZoNUZ0SkhlcE1aaFd0Mk1HVThV?=
 =?utf-8?B?MFpseUhmQUJ0WjFVYUhpcnkxTVFSSm41T0xmUzJOQWZSeXllOW1kOGN3cDRy?=
 =?utf-8?B?UHNOWjFIVy9HWHlmMHBodEVMSnlTNFVUb2k3aG9JcXA1QmJGM1dBUzMzV3RR?=
 =?utf-8?B?dEtnaDZqSStLQlRITGk5L2lWSHp6Y1BTSFlIc0dodGZQTis2ZmZjd0tFdzgy?=
 =?utf-8?B?SEszaENsTFhXZDFpdVkreHR5eGdmY04va3lQZ1FEMEhYTnM3NjZOaUNjUFhN?=
 =?utf-8?B?NGtLVFVXS2FCUGZWTGF5Y0w3SllidUNqamlBZm9xU2RaeU5VR0dtQk82WnZC?=
 =?utf-8?B?V3lyTS95QmtnaFRMaHZoM29uSE05K2FzaWF6MWJ1VDY2RlZEQnZhRGlsR3hx?=
 =?utf-8?B?eDF4Ti9FNlRsU1lWQXJ0MUIvcVBVeXJtNnFyL0JobEFadnQxM2dtT010ZXF2?=
 =?utf-8?B?RVh3ZjRteEpsMUgzZHFJS0FqUDNuc3o2alp5TEhkY0dKNzJMQW5uSy81SVdi?=
 =?utf-8?B?b3A1cGdwT1cwaVlOcFl3MHVJcCtTWGdEVzhBRVV1ZjByYkphNnlxV2RCTThi?=
 =?utf-8?B?VFZSRkdkV3dLbFcvMVBKTUpzQVVOYm5IdUMvekRNWG14Tll5eVVCdVVDWFhh?=
 =?utf-8?B?aHNJSzVud3F6eGltd3A4YlJQVWdqTmJ1Y1lVMzBKSjVsMDM0NlBYT3NEVjY4?=
 =?utf-8?B?UkdnSDdnTmljMElvUXFDamhZZ1FmYjdKWnlTbUxsd1JpaUZodWkwL1dFL2gv?=
 =?utf-8?B?OTlJL0llLzFpTEk5bHZDQU9hZllxS28vRzlHb3NkVVozeWNhSkJJVXNGNXph?=
 =?utf-8?B?SjViYjFLRzNCUWgzMUp4K2NnTVZMdXJQa2F4K3BxYlpZcVc0VTIvTnRwV0xY?=
 =?utf-8?B?c2lTTnVpZDlxK1VtaU9yMTQ5U1l5V1Z2TG43am5XTGlxUnVvbGVaaksxT2N4?=
 =?utf-8?B?RHRzQ0xDM0k5bjJidDRiZE4rekpaYmk1UmZ2ZWNaQ0xrM243TlRBVVpPSXRK?=
 =?utf-8?B?VXRoLzl2UEVRTjJsK3ZiUnpGTkdlQWRGTWtSR1JwNHE1eUowdCtDRE5UOWFm?=
 =?utf-8?B?RGx5c200NCs3b0lEVHpvZ3FJcDBRV245bkxDR3hVQ05kNlVNRndKUDB1NGlX?=
 =?utf-8?B?Q0RpNWlmSUU0SUkrNjE5MkFhMlJXZk1lM3FBRjZ4ZHZaeDBWNDI0K2N4WVFk?=
 =?utf-8?B?NVdJUHJtK3NWWFZWZGhwTmU0KzF2T2NYSGJXRVRQQSszcWcrMk1RalZOWmlq?=
 =?utf-8?Q?gv7+aORGnpmWknE+FzeITkjQRMVcujwBtSd/G?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c46851-2dbe-42b5-b6bd-08de5e7f19c4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:08:32.0985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUs6NyMedwCxbEf9rXmX1DTBzc8nrgCzSCH2NzIqSfm1EaLzpSJ9v/GeEeiiHBMFHC26cmL5eS8lHLTFFqmsBYpUcZooSxn1zdImhgOZ0jM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8351
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 15:08:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8777

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

