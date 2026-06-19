Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1709BCD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 15:25:56 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45055.1781882753842421507
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 08:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hL4GtivB;
 spf=pass (domain: cherry.de, ip: 52.101.84.34, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMHUGozlbIZb+pRoK5lFyPI+/X0y7QQDgGKXNgt8RkgA5YQtUSkcTln7e/MEPo314DWLRS3eHILtZqqBybwNyNW9ERcJVdvRva3UsJsYrb90cquphAIa/OK3Xy9H4w9lJDein+lajHnNuedktO3jNpUxCGX/07W2ARE5+NLCG0vRF5f3HTsi/Ubra0NhENOqeA+d315s/lIeGMwjU2phR1EBwGnr6VMxENYIlecvVX76ZTw9JgVYaqW55ji24yH/Y4pRIYJ3+kSog4nLDL1+rxMNOgsCjYNg82FIb9IMld3N1i+SyH+LCbzqrcJKGB7CaASCLiwFutCfWtYcvUD8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3FDBoj9Kf8GdwrPfhQRs0+rZoTq+Sok93w+NeOKUHU=;
 b=H6nnk9UKjjvoX8JXwywQKnM0ISv7lmJHzNYiwpoa8lyNQzllwmkGjhq4HC0sQ0MaJLyVj74hS556LMPntEQQU2TX0HiLNumPXhJw1Z4NhCUoDCCQuhgq21aDnwiZhC9cOuMl8b76RxjazU1iv72uj3HozIq/pUWR2cmSZJqauxSZWAUPWwSiDcrXoBKT1m50tVpFNR5/iLapvMUtbTLNnmVevCr/a7jdcw8JYpLPNRNuhYkJSHK/HInOir35Hpjh3SaIhFEZJXiy0CPvs0JrNy2sizrEUzbsygln42fxB5YENcp5KRJDmIUPcToRPl5ejNzkhorWeQQ5+JszzLPSbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3FDBoj9Kf8GdwrPfhQRs0+rZoTq+Sok93w+NeOKUHU=;
 b=hL4GtivBECIxB7al7iQVByd3Uur53LB4fX2UkoKZDyHVXgZNCaJfQETrkkgfuzIsU354G5I5/6r0xd1Me2LVEFc4TnzWrSbCAkPRWY31Kl2p8coAq4k6lwu1igTdLiLXJYl4VWza3xsrq1cfUVFXK3y07z0afqXAdAtCxxXL304=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by AS1PR04MB9285.eurprd04.prod.outlook.com (2603:10a6:20b:4df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Fri, 19 Jun
 2026 15:25:49 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 15:25:49 +0000
Message-ID: <4d020955-5dd6-4f61-badb-cef4b32ef61a@cherry.de>
Date: Fri, 19 Jun 2026 17:25:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] kernel-dev: break a paragraph into a bullet list
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <100f2882-f73b-4664-84ff-94819358dd0c@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <100f2882-f73b-4664-84ff-94819358dd0c@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|AS1PR04MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 8558b524-9bab-4e7d-82a5-08dece170a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: 
	AV9qXQT+JK7iH5w41cTHx83l3Yzn6f+rkSuHICUHfb+oImNdE5UR6ilcu9jFnoiVq8BCTbOJ/azyWtSP9g2zr6WjZBLRhBjrdgnvUl1z0RcXf0Mi2iRMKWpVNSday9JqKeFokD62uCxkL6KuIoNS/V2OId6eETb48Fj/VQJeJSJpVS271nIXUJ0P9wv65xmY0Yzpg/AcZeUXVyjzWsJkk7TTnoONpbaPf93ZpGIhed41sPKsgIrlDw9npNFnksKEjQHMLbbN8GGmkvDntbJP0NE6npLuIBcPkywc1xrq3/QxU75nBIcetPpL9Ra800UgYyXDshVWrd9WWtMkN3buzAa41Kdu+M2q4NtGCaNIqN6CoMGn3DLv4oJzyF0VzcLqiu8iNH2Cly1bI5IrJ3r0CnSBrwdWI35iw5CuSQHIIdk83pa7RKQSppTZ1NJXtuCqUsGDv982/QjWN8Yhris/aj+RNn7llOahx1qmzPwYHALyh08oreN2UvUXoq2UvePEgnZm96qF8nzBSAVJ393yMhFnc7rurw9r2m8EqbEYCyrotXQHKgSZ7ChllWco9i0Ndg38HRq7xXmZcj4/9Pe8APKaAbXQoFKP643Um1XKSQsA79442/pkmFda58VeBQvl+6QT6dJYW4f/tmXRR67Pf3zVY2hA0rUUdJkobZpLC7A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGdDejBvWi9LSTlURml6TnZ3OE1nZzdheENaWUllUWowUy93UWphV3lodlNI?=
 =?utf-8?B?RHo0WHJlLzNjSExXZUZLbG5DV3cyM01xQkhRS1ZTOWtvNUs3VWtNd2djN3pp?=
 =?utf-8?B?V1lMME94QWRCYVZ0SVUzZGp4K0dFd2NqT0VWZWJoUkhaNUIrVThQS1VFK041?=
 =?utf-8?B?Umgvc09GVnF0Y2dZR09WaGVrK0NZelVoSEFqamllZTFZak5qOTQ1M2pTc1NQ?=
 =?utf-8?B?djlBQVdhYXFHWmdUTVVBM1Mxd3EvdEJsSHJsb1B5cEE5ZTNodFNTeStWTVR1?=
 =?utf-8?B?UEdCWE9mUUUrWUV0T053Rk0rcFIyTTNaZWR4VU1BWm53MVlaeC9yRWw5aThs?=
 =?utf-8?B?dnR4Rzg0SG1xWUY0MXIvRzU1cWpkQVVBYWpRZElGaGJ1ZDdjLy9PV0pMUVJ3?=
 =?utf-8?B?anRTQVdEMmNMU29tTFVCM1pYSStRc3lOdE94L3JkSGNGaC9WTWFyOWp6dmNN?=
 =?utf-8?B?V3N5dzlrSHpCM0hjVlpyZThCOXVON1k3MU9oQXhDbjF4aEZ4ZnVqODl0ZFBm?=
 =?utf-8?B?OXlpdTFPWUxPWUVuLzVrMklwMGRzS0RRWlBVaTB0RkZCWW5vN29LUGdZVHlW?=
 =?utf-8?B?RE1wR2tyUlhSaFQyc1FMclZUVG4vMThFcU5TN3hxamJLYVJuMlhrR1JWcFZu?=
 =?utf-8?B?L3VmdjFPV3libnNTbmJIR3RxR0l5azRHc1d0ajVGN2xPZGxwRjVhdlZJbmxQ?=
 =?utf-8?B?YS92MUhPMFEyN3FkcW5vLy9PcXZNUmJlUzJHM1c4NTE4b1hFVkY2RDJoRytX?=
 =?utf-8?B?RmRpbDF2TVJybTAySVBQTEk2aTM2cnpVKytjQ1p1K2diSnZyakpQTEU4emhs?=
 =?utf-8?B?WlJ5czZiQ2dHdmZkVjJxTzRBMEluREMrdEtZbmxWbmloczV0dFRrbGlDUThv?=
 =?utf-8?B?TG9GU0RwTklHWFBPS1dtQVVOOEFXbVUzM0VXTGV2M0Q2QU9zM0daK3BNcmtk?=
 =?utf-8?B?aFB1cndRRnI0Q1V1Ry82UnpNNklWOFdoTUlJc1ZZeWFMSUVjQ0xQY1R5dGZM?=
 =?utf-8?B?akJoVVJTMk5qRTZjT0JQMW9KTE4zOVFMbFN1RzY3enUzOGE3aUJzUFBheEhQ?=
 =?utf-8?B?cUtjRDY0ZC9TdW9HSjl4L3hiVzIzaHhkZm1KelRwRE8ybDZPSDlrR1g3S2FG?=
 =?utf-8?B?UXZueXlnckpCVnE2SU1hMWRwdzBjSjlXKzh3L2lZUkFuSlF2YmwzVzk2clZU?=
 =?utf-8?B?aVhzeFViK2p2U0VwVmpQUERzblRsZWN5TE50UFpHd3VqY3ZwRFVrUDhpNUVD?=
 =?utf-8?B?UmlmaEJtWTRsZDJxUFFKM3labHV3WXBBOU9CVEZxNVZBVXcwb0V0QlFMTTlN?=
 =?utf-8?B?NGNJTVdLV2dranRKWWNRVUtoSVhYN08wMDFuMVcyeGZZcm1ndGV1Y2RKcXgy?=
 =?utf-8?B?S3BkbVpFVEoxZzBVMDJubEFqSDhzUFg3dHdtTWowUml6NEJBcjRLUW9nVGhk?=
 =?utf-8?B?YTU5MFlrbkk0bGIzaTBubG14UjI4T3REeDdacHJHY3FKZ1kvM04wRlF0V3pp?=
 =?utf-8?B?YXdjVXFuWFNBVWJrcEpnaEFBeCtZWVVoNUlWS2ZteEVQaGRJU3czWjhSY3ZF?=
 =?utf-8?B?MExLajQ3TTZtNG9heWtScWFuM2lZWjJCR2tlZk9IeVE1RjN6YmVkWElISU8x?=
 =?utf-8?B?VkpGUzRKeDJGdGNFbS9kQldMVkgwVUFnaFh6ZE5lNkk3ZWIrTWJwNDBRanpP?=
 =?utf-8?B?dmZ1OHNkZU54cEtOQWZWdWt2NlZidTJwOEp3R3IrU2laeW5oZmZxTWtJellE?=
 =?utf-8?B?RmRxRUpnSVBaOEt1MVZSZWZsQ1lIK0hIQmVIMW4zTmlxU2xJRzFJQTBvNzNQ?=
 =?utf-8?B?bDVnY1ZsNUJTWWVBeW40M0lydU4veExFRWs1QkZtR3FTNUdoUlVoNURQcUJJ?=
 =?utf-8?B?MWNheWl1NU9reG11VC9teXJUYm9aMTMzeklQa1VqVFBjWVlyRVhIZmNaenNC?=
 =?utf-8?B?R0JMNklkaTIraEFvaVlYQ2hrdzRJZzFoL1pVS3RjbWFoTWJzQ2d4Nm9sU0NP?=
 =?utf-8?B?eGpUeHZ5RUhaMVE0YW81TFhnMDVTRWx0RWw1STRieEdKekNCaVVPNEZrSWM5?=
 =?utf-8?B?M3RzOFRNQml2RE82eUN5YWxmSTc4NUkwYzhSMDM3U3lNVlJSSkk1ZHIvK3Yx?=
 =?utf-8?B?ckltc2UzM09YZkZocFE2SmRUb3o0RC9LWjFhYzVQVmIxSXJxQnpXL05jT1lu?=
 =?utf-8?B?VjVESXE5d21RR0dORjVycDdDczFmRndyblgyZm9KdDlqOFlYQ0gvcjRuK0E5?=
 =?utf-8?B?L3grTnMwb1Bla1hYaVpvdkYrMGI2WEVTajVWdmUremZqQ1IwTXdWZjA0dlFj?=
 =?utf-8?B?cVVYYzVjUUp5aUtHUXpCMEtPTG1mQm90djRWdE0rS3BOVjJZdkZwZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8558b524-9bab-4e7d-82a5-08dece170a9a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:25:49.2051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KQNr58j+HXQz9Vva7drjJtuXCnMiM2UTj69wdPLR3r5HiyLZichnFXVA/DTEM4Gy20IBhPffiqKBs+rsE3cRDCsO8ePb3Qu3v12RIe6NtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9285
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 15:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9800

Hi Robert,

On 6/14/26 8:39 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Redo the first paragraph of the kernel intro section into a more
> easily-readable bullet list.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

