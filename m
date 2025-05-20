Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF79AC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 10:58:21 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.71])
 by mx.groups.io with SMTP id smtpd.web10.18013.1747738693847564907
 for <docs@lists.yoctoproject.org>;
 Tue, 20 May 2025 03:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ts/Qf8mi;
 spf=pass (domain: cherry.de, ip: 40.107.103.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTMBDhg5Q3AY0+L9YPEraM6ZPYwPwA5KJkGajscdwdJtqVMborIkN7qTgWDd0MMWC2qs3PPPPqk2MK4IGyRbayV5M1toV5GZQyTqq+GqWpK6d/MVE6sZXkZgkYAOZgx6aFMfCLS0BHL2OiZvmT9rw6J6Ggw93r/S5YHebZFjhuBC0pHDLJYAF0Vmna+1f2UrD05E6HrJ2hb3uErYuhd8r0VtQeeC8P712RFCa9Bx1yj4dLsT6QamR2ZPyr/FfR+TBnaiJSwTULkrd4NJBMp+WNX+PKKPdREO56VaHrBeFPa+m/MuY2dC3L02OGBRDTevKCdPqSRGVfH7pMCbgtSUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKa9t2fcBjgMP464JgeK4CQFXGB3FTCQx9hY42bFJ7c=;
 b=IWJw+y6z6Qr4sMpdvGWifb4TjB4AGtXqNGknKDXgwv4rTnCs4W15/sAdN5IsjeCJsT7/8p6KHyFMMLgSRbWQbvuqkd3kM08DUvcnoi4k+bLSQ6Y+N1tpkSWFoEL2kRE6qlsTyfwu1iytk7I3bgM3wm0nUonxBfL0ZLPIuYEG1pB5rExRsmzsZT567CVfgBvDFLjSrsR/EXLw72ZPCnaIye2JdXA4x/thmyyBWtzirM/WjLQxzW2630NkgR85+OxMQjMJWy+6GCjOidc/zb8wIUBV6GF7Tde/WArUuW5Eb7SjZGoRe5SqyuRd2HoMOKMBVefqQss6r/Nz2KmKDk6w2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKa9t2fcBjgMP464JgeK4CQFXGB3FTCQx9hY42bFJ7c=;
 b=Ts/Qf8miWa/qERfH0vHYIzlZjMsoxFDSVLJnSo9E8siE1r+4RnIQqGFX1gsaMdCsuKOueLJyLY1Q3ur/1OgiY/7WTw/Ajt5qTYtEW5snv0Gke2RWVuaREtLqWV+dsQ3IysK2hb1gtC0Pjug/7rZdxyBrl5LmLlboSHX+8CUyb+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10254.eurprd04.prod.outlook.com (2603:10a6:800:240::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 10:58:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 10:58:08 +0000
Message-ID: <084a9aa6-e650-4ca6-bf0f-7a061352d7b0@cherry.de>
Date: Tue, 20 May 2025 12:58:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
To: Christos Gavros <gavrosc@yahoo.com>, docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
 Randy MacLeod <randy.macleod@windriver.com>,
 Antonin Godard <antonin.godard@bootlin.com>
References: <20250520101952.4951-1-gavrosc.ref@yahoo.com>
 <20250520101952.4951-1-gavrosc@yahoo.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250520101952.4951-1-gavrosc@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10254:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d8977f-88ba-4d94-77d9-08dd978d346f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T0xRdlMwRE9TZU5NV2hHSUhWMmlkaVAzdzJPMzNJNWdSMStxU2hJajJUcTYy?=
 =?utf-8?B?TnJFeUQ1aU5yWjdFeUdEd2tuYlk4QStuWWx4MDRUQTd0SXRWMW9hQXhRNzNr?=
 =?utf-8?B?ZHZaWmFyRFU3cG1zNDd6bGY2bXMyc3dsTFJQM3cwYVNXYjRGOHBnUDAxS1dv?=
 =?utf-8?B?SVcyQTZKaTcyTXVnbHNqaXdXSWMybVZrT3ppY1JXMkRUTGdTVFVVM08xTGg0?=
 =?utf-8?B?cDAxQ0FqS3V1UjB4c2lCZlJ4NUpIODdHZ0U5QVhITDdJUFNNTHBSTmJjaVcw?=
 =?utf-8?B?emlaeW1rc0RVZktFZGZvYmlGYnFvNnpFNWZUVUtkTHFHSGRzS3VPZGV1M1VH?=
 =?utf-8?B?ZHkzTDVPMmNJYk5IWnV6ZUl6UG83N1AvZ3lUL0NaN3hGc0xlYUdwbHRDRGxL?=
 =?utf-8?B?ckU4TVdEZzNsMGdTYTFrZmxHM2R5KzgwVytMRWJ6aEwzN0Q2T1MrTXdhMU9W?=
 =?utf-8?B?eUJuS2lJSXRLSkt4ZEhGQ2l2Z0Q4TTZ1Qm91U1dIKzFkM3FzTjBHR1JyMDhm?=
 =?utf-8?B?aTNSNjl6M1QzWENRK3FhS3dPTXJXcVRrMXN4VDRSdWtwa0tiaFNYdUlYWXFa?=
 =?utf-8?B?MVVjR0JxbDc2SUN5b2xnNUl4NFdBYnQ1SkZ1ZWxrc3pKeTh2d0Y2RG9oeEw2?=
 =?utf-8?B?Y1pIZ01lbjVYa0J1cG9LN09mWUp2SGtyQ0JQQ2trTlhKZ1FueXV1cHZaaTFT?=
 =?utf-8?B?ZGhET2hrTFJGNmZNdkdkUnoxcktjRjU3cGVrMnhhUHdjNi9XMUJDblZaSEtK?=
 =?utf-8?B?TW8zUUF4d2hVelBiSzNUY0ZaVUFvdVJmSDZCTG5kSVhhbHRTalM2ZnN5Z052?=
 =?utf-8?B?WmhVZkxEa1RJelRrOUdwdGNPc1lmM3Fod2xCMEtVcVBabzR6NmRGbnIxd1ls?=
 =?utf-8?B?NTEyaFBtOFYrN0xocmNla2RkR0tTcmwzQjYrbllYZHhXM2RGcVNuZy91SVV0?=
 =?utf-8?B?eVlMc0ZFMEY4WHB0emtBdFNhaGhGNThhQWJOdXd2M2NRSDdvN2Y5aTdBWjNI?=
 =?utf-8?B?dnlkdVJCMTNTN0xqdkIvbWR1di81K1p6TnlOdTlqRUcwRGo1WFZ6RkFhS1R0?=
 =?utf-8?B?ektUOTJzMDdYSHh6aGlQZzIzamlxZHMreVBtNUFtNG55RmU3OUprK0psMFJ5?=
 =?utf-8?B?Q3RIakVQelRIc1ErSU1XYlJnOVVudG9OR3FOYVZzL0RkaUJJT25laVFjNlFj?=
 =?utf-8?B?bEJyVUFSb0Nma2NTQVdUZmRvQWJXOGp2cldpU3VLTE10dHBtR3NRRDJJSURR?=
 =?utf-8?B?azVEMThVRHYwYWJOQm5IUHRjSm5EQm1oT3dXRlk2eFVNaFFPaHN6RXJZNVht?=
 =?utf-8?B?SGhmL256Nk16RkprdXRoOVQ1OE5rU1lLaG52R1c2bWtrU281dmFpZDR3RUpz?=
 =?utf-8?B?Nzd3YjNzYlhRK3ZaaTV5aFg1ZUIyZktrRXJWdnNXQlp1UzZxL05OMy9HTE9I?=
 =?utf-8?B?QnBsc3grMm9BdGJEOWlHcG8yandYUmdLN3dBei91aGV1MnBBUG5CUzNxQzll?=
 =?utf-8?B?VklFSTgxRUFEanlMaGswZ3JoNzBwbGJEYkl4VmhoV0lkSDdmdUJhTlRyMXNU?=
 =?utf-8?B?MVZUMlBpcjE3VEZGbmJDZG4rYU9ZVStpTHhIM0JOUEJJaGc1SGJJUnN4bDc1?=
 =?utf-8?B?UVRVZHliL2c2U1B3dlFmMlhjaFh0bys2Vjgva05hTml2SDlHcHpwRzk2MjBQ?=
 =?utf-8?B?QkJFeGZjUmhUWWw2K0JKeXBuOEVVUFAxd1pHdmM4Y3ZZYmZQbFFEMWRHWi9u?=
 =?utf-8?B?TG5UZFZnSUNEejN6ODhaem9TdmU3dkJwOVFtL3hLZ1Ixa3BWNUt0USs2YXcy?=
 =?utf-8?B?RVhWM1RrZ09iNHk3bzVvY0RJVkFmbVdaK3RqaVlZMm11bVdoTjBzdXo3SEtK?=
 =?utf-8?B?ZW5hV3VLZWM3K2krL2tXRDNVc2NlZ0dTazBFVTFQUzBEanc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SStKcERqMzJvTk9ucDROL0pUZTY5M0JUWmlaazZOaHNQc0p2NkRhU2RZVUFv?=
 =?utf-8?B?NFVMQzBpQVNMNzVSeCtnVHJHcmdYS2ZUU1Viam1TbXBXcjJJa1NlanhYUDEx?=
 =?utf-8?B?RUc3Y2ErWDlDVk5aNzAvU2JoeVNHcGRTNGFtNXBiV1cvYXdKejZZVHgrMGVZ?=
 =?utf-8?B?SXNubkJvSlFoVFJ3aVZ1cHN2L1dSZ05Sd2F0UDRDYkRlZ05aYS9Fa2cvaDVB?=
 =?utf-8?B?cmlrUzhjRkI3ampNQTBRUkMwekdVSHh4bnQzYmFVelZ5dUhiazA5cWxHWE1X?=
 =?utf-8?B?YWNXenlsZWhPbTZGbmxoeGQxeDJJaVgzdTdHUitTZGlqVjZySm02UVRyc0dB?=
 =?utf-8?B?TEZRNW5qRDh6NkxHUCtDVkVaUmZiVVdteU15aFVDTUtEc0NhOWRUL0ZyTnZw?=
 =?utf-8?B?Zk1HZFkwVHFvbDJjYUxKckhlbklrTVMvVXRuZFVJQjhtM05Ka3hjeU15elAy?=
 =?utf-8?B?bGg4YUFMbDJFVnFtUHdhQ2hJdktJTHEyMEZVUUVjMFluSHlhY2xGeDMwWlNn?=
 =?utf-8?B?WVNCZHp6YkJNMmxlbnE5VnVzY1pHTko2R2poY29XUjEvb3RWWnRYQ1lJUjVj?=
 =?utf-8?B?b0lQWHEvRGFXVlFmNEV6aXlHSnhjMWZsVTVuRE1lU1FCQVpFcTJqT2pCTWhB?=
 =?utf-8?B?TzA0K0VvZWhQRHdLVzNQcFYva01oU2Q3QXFNYkM2dXE5dDM2aWt2ZCtxRjJ1?=
 =?utf-8?B?RWtjS1VubTJxazFKMzhYVzVyZ2pVM1NCRWFTektSNWUyM0lLNkF1TDdwWGta?=
 =?utf-8?B?SUtQM2t4cjVSSGZVdE9TN0VPci9sNzZOUFhyYlNLRis1TEw5R3dCcWhQUmhK?=
 =?utf-8?B?SHBjSWcwaTViRGxjb2FGNXNuV25wVEh4WlE3ckk5MmlVMVpsSENYUmxRSkpG?=
 =?utf-8?B?N2lBWUtwaURtazF6ZXdBWWYxVGFjT3lCN1R6QzBQbURtZW1aOWVUeXJzcmt4?=
 =?utf-8?B?OEdXYnJua1hMc29IcG04d2RCbVl4TkE1bXNldmsxNnh2djRkb2JwOUdtLzFi?=
 =?utf-8?B?SzFPaGwvL2JOeTFhVGtaUmdtTHYvY1crc0NmVk1FSkpscEFDS3BrQW5aZm9m?=
 =?utf-8?B?NzhCZ2JCQk9RUkpjV2xYRUc1R09rdmR0RmdMakVCTTBOcHFLeXVZb09QVFVZ?=
 =?utf-8?B?R3NRYkVlL28ydkJCVnJWWXF5eDRxY1kzRFk1SFlGU0g3b1FaZmkyWk9SNllN?=
 =?utf-8?B?aHJBcFlZa2xHNy9pWTFaaEtOL1BmWWExbWQxYWRjS1l0OWVvL2dJYUU0NXFE?=
 =?utf-8?B?M2tXeHcxZjQ3a2lzanhCTDBaclRWcDFxakxVcXhXanlMK01mdFRhb3lneUpP?=
 =?utf-8?B?U1FROWthb0lWZzNkZ0E1TFNoTEVldW1ldHI1RVhFK2lOayt5ODErSEtlVGhZ?=
 =?utf-8?B?ZkpiWlNFK2NMcFJ2VTdFNjlzZ2RjQkdlZDVYY0NJVURMYXdOQzBEMXcrRVEw?=
 =?utf-8?B?WUwwVkNESXcwZnRHdHlNeUU4M2pnQTk2RTZMTFUwZHY3VDBMRUFiMkJpRzd3?=
 =?utf-8?B?NTJ4bFUxNCtQOU53RUQybmd2VG9ITGNrbGxUZmhCdTZVK3RQYmtuUDAySCtV?=
 =?utf-8?B?MTcwd0pxeGNEb3BzbHRCN05ZZmNOanE5MGdCSVp3bmdUdnN1cnR5bXVOK0lp?=
 =?utf-8?B?cmlpcXhheEVJSjFCSGxuTGVCL2pHVjZpcG1JWVp5YUVlRmZDeitGM0I2RS9k?=
 =?utf-8?B?R25ZaUJ4djNNRGZnYi9pQnVxdzFWbTNZdVZ6UjNSZmM0S1ZIVTFTdWp5OHpl?=
 =?utf-8?B?eWJweHN1eUhaaFFYcGJ3aGhKeVFwUmh5OG0zWXd1YmRTRjU1SVpKZkd3cEFo?=
 =?utf-8?B?MlUzaGg1UjFBdnZoaVh5Z0tjR1BHa2FvSHBVS2lTR2tVTXBnM1E0b1ZJWEpn?=
 =?utf-8?B?NkFGWTU4RDFxSTc2LytCYlByYnlIVk5tNWNmTTBHdmhobVhGT3pxYVJ1blFS?=
 =?utf-8?B?eHZLclhUUHpVcVRGMnF6MEJQdnJWcWFWOVIwM3ZwbEhXSDVvSWN1VENqRjEx?=
 =?utf-8?B?V0FDaXYrNjBieHhaRVRRcWVaYzNFOXpNS05tbWhuMWl4VlZzNnFYTGw4L09s?=
 =?utf-8?B?WVV0alBIeXVZeHJHSG5VTnBXdzdQOGQ4d3lVQ25WOWE2MzV3OTJjQVM4ZDBm?=
 =?utf-8?B?WjhwcGovOFlJZXU4eTlGRU5rYnZUbFcyakpyUEQwS2ljWUF4dDIwSG1vaEF4?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d8977f-88ba-4d94-77d9-08dd978d346f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 10:58:08.4578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pG4iHZJKOKRtAmK/8pEp3+8XCy0yQoexFfjzQt7jK2bOdZ4ckgMHz63MPiVB1kJsxHwbPECUrVmZACmT+BSsvNYIdhOfXQT4JVXtA/VGLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10254
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 May 2025 10:58:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6850

Hi Christos,

On 5/20/25 12:19 PM, Christos Gavros wrote:
> This variable specifies the maximum allowed size
> of the initramfs image in Kbytes.
> Fixes [YOCTO #15797]
> 
> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> CC: Antonin Godard <antonin.godard@bootlin.com>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> v4->v5
> * add Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

No need to send a new version just for that, the maintainer will (may) 
add it when applying the patch.

If a new version is necessary because of feedback, then please add the 
Reviewed-by and other tags when sending the new version.

Thanks!
Quentin

