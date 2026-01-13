Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903DDD2D0F0
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:09:22 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58709.1768309760118269003
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bgbNu9JT;
 spf=pass (domain: cherry.de, ip: 40.107.130.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TePPPNKZsZTdCUdfJ53zhy+3IY/qirCVvXX0gmmHf9+d6lRapa0zPBkk1DnzV35JwYBkZr7/S00U8tenUb3sTlCPfWZ+POK5ZJceV3mMHxLELtR2idw1BOvgWz+yDiQUBcAKq2H/DKYYlrLnPW1wUzQEidXUWifSSaDYIbzGVUiAmebW2RISjmhOv3iMrom7BumP7xISZHMmpTdwyr/n7k57QSzviD2UwPVoqIxM3KCrvOLgpD4PwlPtJn20UhiMJtxgvBg9mp4bGEVXKOeE92P9cVLQXo/w91ZugvBwmJBt497NhoF6QlzODlI2yjfuL2otzB6ueEZUB6+n44z7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qosho1BjtDlvfCuqJ2QZ+xIZxvHBVRr4/Y1tDSzvvY=;
 b=GL93jabOQNsjhV+9HXuN6HY+4WyO5jrYgOP7Sz5K3N/21TuavY9Z4FopPizuGKQWq7nJYPEuVYxp43sYk1k5xXNToYZvGApBvWV/hM7dC5xBPM8+VDO4F+N9MkHp3U4pRgdjtW1Z9L2ZVeVyi4QfklOQrBOIdPPKpMk0dLNntHH/5kDVrLSJBwTyWR7x+KBmiMlvxM33U78xJUKByts09GXnOPdurejxrgqBEU8SA/N8wiZJF3MBybdukQYlgTOE03aJvA5CIQuAObr5hOIhFYiow3V/BMU3BRpeqsPlivnD7tGc0U/tU9DetuoH/iRmIYxh1DElKREwaiLV/CsRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qosho1BjtDlvfCuqJ2QZ+xIZxvHBVRr4/Y1tDSzvvY=;
 b=bgbNu9JT6S7MJiQ/QHaZMcYMLHNlyP8r5NaYtBpXrlQj6Bq5H17/sJGlwlBwOmPtXKF/CDpj0NhACD8+QqPgJwcCBRvmGkAdeYrn96yyDx2/8UzaVMqazO8Y1ZPYHoYejCV9u/zLcHorwqhGP1hxAc+v07SSxvi7tkUnk64ytp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBAPR04MB7269.eurprd04.prod.outlook.com (2603:10a6:10:1a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:09:16 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:09:16 +0000
Message-ID: <e1d0093f-688b-4bcb-81c6-cad944d0d572@cherry.de>
Date: Tue, 13 Jan 2026 14:09:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 14/53] dev-manual/new-recipe.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-14-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-14-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::6) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBAPR04MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 3949d09d-f0b6-4b8d-a0d3-08de52a4f43e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MlZVSjN5N1ZmMHNpUkZ2OHBWUGlaYlVEUy9KRFlPWEl2S2FrZVlyYkM4SkZX?=
 =?utf-8?B?Q3M5bitJRjZ0T0VBdWpUaEdDMWowcHJrUm9jTWsrMEUvZkhvUVJWMjBZUjY2?=
 =?utf-8?B?WmNYMHNqZjhUbXRlMWFGcVpabDhNQXFFVXNONUMxVEJrY2dwb3J4QnFMUkhU?=
 =?utf-8?B?NE9Qa0RQSC92bnZiVVBZbFdldlBqeXBFanlCUjFKR3Zpblp6U09uVW5PTHJY?=
 =?utf-8?B?eld5VFN2a1V0b1FwTW9PcXpmV1lLU0dXZE1BWTIzaVZLSlVrRFQ1cXF3Nnlr?=
 =?utf-8?B?cHF0b1NET2JzNkh6Rm5mMW1vVENsaks4VFAyTFpEUnBqclZINEdBZGxLd043?=
 =?utf-8?B?YnFuUWpJKzVaTHB6clhSZDg2Zzg0a2JxQ0NGUGZNbE9MMnh3cjBjSE1PWC9R?=
 =?utf-8?B?UjBnZ2Y0MmxDVEN2cEZKQVFiRFFlMytHN3c4Sk9CZHE3SzlDcjUrNEd5Z1Nk?=
 =?utf-8?B?MlNSbHNXb1FBVC9ndGtJNCsvbmdFTHQvNEtRQ3pmWDF6ZlhCYnVhdGJVQ3Bq?=
 =?utf-8?B?enRvc0c5TFRaZUJ6ckpFQmdTTUxvc3dKNDhMcHpSbVViZHJSRFY1TUpPbmRv?=
 =?utf-8?B?YTFTRC8ybEtqd052T2lnck9DdUc4V3hwZHEvdm8zd3ZEOUNyTFRpM0lFMnUx?=
 =?utf-8?B?TUgrakRFYWMzNlhodXRNNFpPMkczMkIybmFZbGxyaGQvVHFtTmU1OEhUL05u?=
 =?utf-8?B?NTZCK1ErTXE4RTJ4ejdJZ3VLbEM2WFg4M2JTeGRwL3QyN1Uzdmg3RkdZcVlQ?=
 =?utf-8?B?Vy83cmQrSW8zaWMzSWdPWXZUZllOdWRlTGw2WU8rREpQYlBVbnBMMlZOSGw1?=
 =?utf-8?B?R2tVdGdpSWlrTzNObCtGbmVqRVh1ZjVwYzhnMUtoYUo2cWI3WitrRklaNEMv?=
 =?utf-8?B?Z25EQjErWHBxMW1ML1ZWTCsvR0xYNzdEbi9ueThUdHVuRmYwc0IxQjluT2pD?=
 =?utf-8?B?YldYcnRHNDM2M0FWOG4xakY0MDZyaUNidFpNWTdoOFg2NVJpSVpuNTIwRjI0?=
 =?utf-8?B?STh5Sk1lMnY1MFFURllXMXpuMFZUc0xmNG9LVnE4M0JLRlZ4VzBETFJUTjdM?=
 =?utf-8?B?dEpBbDdyc0tTN29yWktuWC9YZi9CajUwRGRaT3VVU3Z1UG5RQnMrYmJYUVFG?=
 =?utf-8?B?ekkvR1puSGg4Z0pNdnJqaHhxbEhibzFQbFZ6UkRrei9jeWVkL0h1RDV4OEZ3?=
 =?utf-8?B?aHN6dis3eFBTZTdWUUZNYWs3bzJjaFAxZXVJeHduL20vNVBJdUZzaHV4RTcv?=
 =?utf-8?B?Z0hyU3NUYUdlN1E1MjJKZ0RGM05vUTFJOWJYSEd1cVNJd1NBNkNNQWd4Ums4?=
 =?utf-8?B?MHpNdHkrbkpDdWFqKzZ6UWQ3emdGazYyeHJZVVUvT244TS83MnJuckVpSDZI?=
 =?utf-8?B?N2hQQmxJUnJWTmVIU2duQm5xVDUvY2JEbUJJNVhFTW5Xa1BNeWVFUWQ5V2oy?=
 =?utf-8?B?YjlVVnFOdGJGUTh2ZHRycFdqNm92TXdFQXNjREhrRElRbjB3ZjgyTFdyalEy?=
 =?utf-8?B?WS95c2Z6UkFPVlRhTk9odHh5OU90R3kwNFZ2Skl5RlV1YUszYnFvakplQllS?=
 =?utf-8?B?VERPTmhwSFJER0dwU3FyelZPdm14UTBOWXNLQ2J5OHJZSlBLWTAxeTIrL0Fl?=
 =?utf-8?B?V2t2ZExrclk4VDB3MjZkbXJoZHFReHhwMFFTb3VnRE5DSGY1VklIblJMMlND?=
 =?utf-8?B?aWp1MUw1Qm01RnZ0T3ZpcDJaYVFqOXYrM1lVMFREQWhKU1B4Z3k4Ui91NHBQ?=
 =?utf-8?B?d20wZVUxUUVmM2JsTkZ1YzlCSWtxUUs1ay9YbmNjbGhyWVl0MkJNUWNYbDlQ?=
 =?utf-8?B?amRHTXB4OXdDMm45NHRsRlphaThxbmtHWWIwZmllYzJLYmRNaUdZcmloaC9y?=
 =?utf-8?B?RTJCczlLWElXYmtRc3QxYzdKcnNUN0VjTGkrMTY3b3pxV0xKTnIxcXptT0ZM?=
 =?utf-8?Q?gY49yA5uQLdioBsuzc1alfqD3fXlEwMs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0pUUDkwQU8zVWhVUG1zckFudXhOQnBDRlhmYlFFRWdjeUhObDNwU2t6L2ky?=
 =?utf-8?B?YUtudE0ycTVVMjE2MGMxbzRQWCtuZExtdTA0eVVjYTRtREIrQkxiYTA4MmZN?=
 =?utf-8?B?bjQ1NmdGNTh3U25kb0tqQUNlTk5FN0J5VmxJNXd6aHg3Y2NlZU1iMWo5T0RH?=
 =?utf-8?B?dE8xNUVSaEw4YUxsdXBxMkZEam83TG4yVGlXLzFkWWRKTkt5dTh1SW1GK1I1?=
 =?utf-8?B?WHpQSk4zQWUyNGRTT1FTbEh4QnFNczRCZk9qekMwSEk4Z3pYbHBiUVFTNG9S?=
 =?utf-8?B?bTZFcHZhc1RWb1JwN1Q1eW9hQWtMNGdyZk9rQnduanNWa1RtWkRHTUwraGJU?=
 =?utf-8?B?cHB1QUhTbTNJUUFhTEJkNjZhVTZGajFzTGdlNVVyRDlKbWdVdktOc1lDdTdR?=
 =?utf-8?B?ODlILzlPd3g3RzV0OGFkWGhaYUw2d1VmOUpKOC95RUQyaEJhbjdhUk8vQWJz?=
 =?utf-8?B?czFsQTdVbUk3Z0llU3gySndUaHVxa0RnSUIzU1VQN0JaREkyby9NNkczU1Yw?=
 =?utf-8?B?bDhYNzhDamEwUkJXejhpRExRNWtRVHNpTEJHeWhNbG9lYjJ1VUM2NWNsQm1S?=
 =?utf-8?B?L1pOQy90Yk5RU3RYL2dHUzlKdE9Qd1puR055bWg1c2YvaHQwUWpBTnk1TWFo?=
 =?utf-8?B?c1pUMlZqVVZuUUFZU2lYRzU0UWhLWTloQjhibk1KTDFxT3Y4cTNiZCswaytW?=
 =?utf-8?B?L0JJZEVtdkd6ZWVJTXFCQmdmQ0oxLzdQOG9sTHlKblJndzF2dFhXcTI4eUUx?=
 =?utf-8?B?bkdPUFAyZXpYNGNSWUVRcGJ5Z3UwdDRTY21ETXdLNzdXeXM0MkpEZjBycmdv?=
 =?utf-8?B?cEZMS29sU2V5OTFuaFZMdXFraCtwVjZoQ0MreHFGZ2h4VWl0RlM5SjlGVzRC?=
 =?utf-8?B?TFdsVkVVampQM1grWU9xbGpUT0Qvc2todERHUEFXdEk0NFJhLytHZjRsWVJJ?=
 =?utf-8?B?TDVvSEpFZkJjVlBZVyt1N0FiSmFwMHZrTHEyK0tnU3BMMldwN3VydTdzWmJ5?=
 =?utf-8?B?QVJ4cXBDeURDSGVJRjQ0ajc4a3F6enlMdkZqOXQ4aFhmQ3IvWHB2MzJpaGMx?=
 =?utf-8?B?VS9UWGhlTVkyUFZaNjFvaFFjRVVrUzlOUHd4NFllRklGN3VUOEgrd1B1V0cz?=
 =?utf-8?B?TEc5eU1hUXJCNzJnMXRCaWpHb0c4N0JxcFJqVFp3VG8yaG1DNTFEMzRKcXp5?=
 =?utf-8?B?allubU1NSnllNmNZMXdNMEpZZjBNRGh1VW0rbm13bEVKeHVSUWZMQ254alhh?=
 =?utf-8?B?QWhpaWNDeGIxZU9WMzZieFluNnI3OU5hUHA5VTBhMzltZmxJWXhEeGpPVUpx?=
 =?utf-8?B?UzE1QytkWHFFYlRBRHNoSlZ6QUp1bUFLWXBtbDFmYTI0MEpaVGUrVit2VWtv?=
 =?utf-8?B?YjFFbVAvQUtrc2E5dmFZWWs0dG50ZDRPaW94WjFXS29JbkhISk1zd2RXbFFT?=
 =?utf-8?B?UVlITW5tMmY4bGFVUWtaS3dibGd4ZXRIeVFvVkY3WDNRNEFVZ0VHSHVabjZS?=
 =?utf-8?B?WURjZ0swOGIrd2ZnZml3WWFyQkFNeThoTmFOTjNzWGZJU2twaFBnRlVQU2lr?=
 =?utf-8?B?eUdRM0hVcjd2NlhvQ1ZkZkVNaW5FREk2bnhpZWRMVGJERzBIVkJCU2xrV3pJ?=
 =?utf-8?B?Tk9tdEZYL2JiOGpqTFN4dm1tU3U4NkJsRmZsK1RKdk9UQms4cmR0cTJCUlFG?=
 =?utf-8?B?SEo5SWg1MEV2dVJXaEtCY2RTbFh3eDE1Tm82a0k0Y0U0V3NKYkJIbzRpbjIr?=
 =?utf-8?B?T3BwL2lpUml5Mzd3SFBEcUV6c2RxMzg5S0x4Z3ZLdXZJK2wyQW5XK21GK2tQ?=
 =?utf-8?B?eVBVMGxHa2RnQ0VVTHE1SmtLUEhJclZueXE0M3pmVVQ4L1R3SFVCVzh3Q2JR?=
 =?utf-8?B?ZGxSN3pMZTBiR0VtcE9oNHFYUVlJc2JuTGZHNFd5VWhtY1JEdlZhQzB1Wks2?=
 =?utf-8?B?YnAxYldDZWV6Z0FNSE5wcnlGVVNzNXBhR1lZZVYvUmxGTmF2NGhhaGVtUy9t?=
 =?utf-8?B?L1kzQ0FMSk82VGdzK2dDS3NtVXk4VXRpdVpOclVyMHR5UXE5TjdheE1hcCtu?=
 =?utf-8?B?MkdvaTltVlpaRWF4UEdsenJ1UVRnQjkySDh5ZXVOSkY0bG5GY2FteHdSUXA0?=
 =?utf-8?B?S1BjQUd1c2pzUkUyc3J5eEphYkN4WXpvTFdzT1BnSEI4VmNNN1hMVGhwNzVn?=
 =?utf-8?B?MDJ5bXFKUWRvQk83bGtVTU4zSDJKdm9GU1NqM2cxS2hZZUFCREhIcVZzMXdw?=
 =?utf-8?B?ODRGYjhPSk4wdVdOT3NmQ0NqdTU4eWh6bXZuTThZVnRDaVRZL09wUTRmbHpB?=
 =?utf-8?B?RjcxVEJpa0FKR0xxMklYT0Z1LzNhaVIvR1c0aHQwWHVxN05SUWR0QT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3949d09d-f0b6-4b8d-a0d3-08de52a4f43e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:09:16.0212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nETl1TKkIwZTJk0fGiwxggp3aMfoy6BVSYkSKP9VH5uuz/t42JOpITQ+nfyScM/7JthWdrFtrOMmz0tyxz0XDxmskZFFVFGDL+oi4U7Gpis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7269
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:09:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8495

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/new-recipe.rst | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
> index ee0f6aaf6..38485da7e 100644
> --- a/documentation/dev-manual/new-recipe.rst
> +++ b/documentation/dev-manual/new-recipe.rst
> @@ -224,14 +224,14 @@ is to use the ``bitbake-getvar`` utility::
>   
>      $ bitbake-getvar -r basename WORKDIR
>   
> -As an example, assume a Source Directory
> -top-level folder named ``poky``, a default :term:`Build Directory` at
> -``poky/build``, and a ``qemux86-poky-linux`` machine target system.
> +As an example, assume a :term:`Source Directory`
> +top-level folder named ``work``, a default :term:`Build Directory` at
> +``project/build``, and a ``qemux86-poky-linux`` machine target system.

Uuuuuuuh. Is it really qemux86-poky-linux machine target system? (I 
don't understand what "machine target system" even means).

Should that rather be

``qemux86`` :term:`MACHINE`, ``poky`` :term:`DISTRO` and ``linux`` as 
:term:`TARGET_OS` (c.f. :term:`MULTIMACH_TARGET_SYS`).

>   Furthermore, suppose your recipe is named ``foo_1.3.0.bb``. In this
>   case, the work directory the build system uses to build the package
>   would be as follows::
>   
> -   poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
> +   project/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
>   

Ah, then maybe we want this root directory be the same as in the 
previous commit (where I commented maybe we want to do s/project/yocto/).

Also, isn't that the case only if PACKAGE_ARCH=MACHINE_ARCH for foo? 
Otherwise it's TUNE_PKGARCH-DISTRO-linux by default?

Cheers,
Quentin

