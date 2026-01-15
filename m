Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09232D41163
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:27:53 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32527.1768472864420648846
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 02:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=U5LEvIaG;
 spf=pass (domain: cherry.de, ip: 40.107.130.33, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xwb2q8cnVZCWIsVutqdALKdUY82avYIAIW7x5C0tTpCKHyQeOtd/jqCeqWX1ap0JxCNttZ20+bsMguLTnKwfVGOKIAQ+a//Drs8yA2Z0XS7n8xCh9Nfno2ZRnddxASgbFgkIfe2KTtS9SeWndxukBZPnqoEDx5CrJeTEu66y2bZeGYqYSZdu/7zehmcJLlI3cW1561JotCV+rQtlu4gpK3Tn8tuaaoLGZrNuYlatQmmdRWWTFvVsOZoCblVdRZk14P/hNu+TGnYtUcoFZylz+R8gNEXQVd6ufWNXTNmj1tIAJHihQYBRqA38yMsaVIY0OigPv2jTsJq0dZGFXVEGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5N5B6dS/q6dAkdFXBcqF/UDGgvUhX+LlQJxKz3hIzo=;
 b=u8lHOZj8b5XVPaKpupL164kpPkpjg/RN9OqvHK1Gp/HB69LEiYNyCD1UMs+JW8cNVqRhfQeGus7pNcyivQiequmvtCe+1nJdvFWBn9bWPeGWZIBCE648fwUz60HQ5/MBvwgrjA8V9zdthXTXnx/NEX/P7x304STJWkpohXxQFXU3oxpl10zQuv+AkYTg0SRdceUcN9VyDR97V1Ei+Pe5lBhgfJAABh2NmL4NN2U6QJsN8vFEm0HedTC9/2N7qCnlZd5IRuUfCR6nvlgGoeFdImp16Fe3XxuEmP8nMG4CMmpu5rA903moMVWgT522qYizJ+hao3MDPD0YuM/7R2GivA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5N5B6dS/q6dAkdFXBcqF/UDGgvUhX+LlQJxKz3hIzo=;
 b=U5LEvIaGtTcPmpWOLw4Ekn3E8A3CYX0MX51XDgWFjdHLqkPBA7hEl8QXoUeyQ0Fz29wvoMj35c6deuqFx7H8EdVLDyeO2+Sy6IeMwR39lZrYWp1VqB67vwHF0linUuYdlhqXNK7FksDQaLiVJEwqfKEdv3TbCvttjA6x1KgrPgQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7692.eurprd04.prod.outlook.com (2603:10a6:10:1f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 10:27:41 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 10:27:40 +0000
Message-ID: <5c5447d3-cf65-4b71-92cc-5a5c7f6f0aa1@cherry.de>
Date: Thu, 15 Jan 2026 11:27:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 4/5] dev-manual/poky-manual-setup.rst: mention the
 Source Directory
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
 <20251224-terms-refresh-v1-4-691329fd038f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-terms-refresh-v1-4-691329fd038f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: aa158a22-028a-4465-c2f8-08de5420b642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UWprRWxucE1BbkEzanVXNGhiUHd6SGRQcExUQkplL0QrVmR1bEdLL2R6bmg2?=
 =?utf-8?B?bEp4aTQwRGNtSGVUbFJWV1M4UkVYSUxScnpXdFUyd2orM1E2WG9PZFovWXFG?=
 =?utf-8?B?Ykxwc2w0a3A5NGN6d0JkY285NWlya0FQaVdVZGJnNzdhTDFiU2U1bUJ5UlNJ?=
 =?utf-8?B?VktpMXBucUM1dElyYUhrTzd3NUFkaDBWcUpSeHl4ODgxU3NQeExld21Xayta?=
 =?utf-8?B?dGNtUmVmOGd6L21BSDFmdVB2UkhQMkkwb0Y2SWlWdWNza2tYZWUwTmhKZWlW?=
 =?utf-8?B?U0Q0aWhOeGdvbm4zcVFWdDBkNW93bC91TDdZNzE3WU1TUGcxc1ptWlFPaWZY?=
 =?utf-8?B?WlIxZjc1T2U0bTNIaGVXT3dNaXNxdnFvQzJhbjhMQUg3NXgzN3BMbTh4MUZh?=
 =?utf-8?B?Y243aDhYNEZlczRHanIwY1l1Rm5XU0duL2Z0SGQ1bW1IUVRmTnEyQW02dHNZ?=
 =?utf-8?B?a0RTdVZFVHpIcjRjZkVadTZLU1hjMHRkUWFXeW9WZGx3VHBtbWVXUysrUjRs?=
 =?utf-8?B?YWRVQXhLc2lFR0JrbE16aFVjaTMxR2c0NHIyNXJ2QUVNbys3M0tyT2VjVUd5?=
 =?utf-8?B?cjUzK0RVTDd3SnpScjdFZ3ZNNTBDZXpYVWdqdVVkWHNNb1RaSytTTmk3ZEJz?=
 =?utf-8?B?bWowREp0S3JxNndjb25rYWdBaDdtbENmc0ROVGpodmNLd3FvVjlnWHFnOFFJ?=
 =?utf-8?B?WUNOK3kwZkxaeWRxaWVKZ1dEMExJK2NUR0d4YlpzM1ZaZVZtK2RnR2N6ajFx?=
 =?utf-8?B?NW1pZFZSTVFtc2RPYm1iSFBvMlNTWTFVZ2lLRFYvR1lJdHpmUjZxS0FHOGRs?=
 =?utf-8?B?b0NIYXc5UDZocXRGcFJ5OWszSHphTW1haGNqUyszL1Z2ZGxsVUZ5eFl5T2tm?=
 =?utf-8?B?NDU4U202aGFGSG9qcEZuTzBCcWJyejlNSk11NnYrNFhIeFhhV2VHVmhjb3c2?=
 =?utf-8?B?ZkxFamRqQWxCVjhZcFVhWjBCYUVHK1ZidElVNU5OSDVja1N0VVFDbmNhN0M5?=
 =?utf-8?B?MVprTVpISWRvdWxwdU5neHBoTlh6Qk5NM3l1YXI1MUhkOEtlaEhXMmZrM0dj?=
 =?utf-8?B?M0t0MEtFU083cnBMYnYyZ3ZJWUU2VTN4MENtN3dSRTgveFlZZ2pJWFRRN0RR?=
 =?utf-8?B?UFlCQ2haRDMzWWZJeUxjSHRGNC9SRHB0cm9WNWhJQ0wzQUQ2MlJjUkxkeExl?=
 =?utf-8?B?azd3NjdLOEFxR1R5ZEJRR2RFNGZiZ0d2NytJdEhkbU5xNVhlbW5lUXI4eDNy?=
 =?utf-8?B?dVBCenUyM0pma2dEVCtETDIwL3BFUDlFQmtHd09OOEdSL0o4cFJOMm53MXJx?=
 =?utf-8?B?bVFuUCtsNGZVVUJuREZDeTRsaEROamloSm9pdFpSWDFkQlVGdjV6cURBc0Z6?=
 =?utf-8?B?eHNKQm5pTFBoQnVQbEx5Yll1VEVPQ0dMc3VCUHFnM0RGTHhmcjA1ZXpIeWlL?=
 =?utf-8?B?MGFQRnQ3UUNkRU9laEFiTTNjL3NuV2NMNThsSjRCVUZhQWxybW55MVNWdDZt?=
 =?utf-8?B?cWYzeWhMblVmWU5VekQrSWpsaWRvK2xKMFhXY1JINzY2UzRJTG5ORElaZFhJ?=
 =?utf-8?B?Zk9TQWxPME55dXRKWDhCYmYva05CRWVXeEdCWStyUEN4ajF5eE9BOS9iQnBO?=
 =?utf-8?B?ckZON21EV0xub2taeGlRcU5ZUmR4OWE0eHZwQTlGMVE1d0puOFU3WmdUYUpF?=
 =?utf-8?B?UXRaNHBCUXRUamd1eFhWU1lRYVE0cUNUSyt2akFTaUFOTFRqRytoMmhTZGwz?=
 =?utf-8?B?WExRdEoxZ3M0bXVjNGx6TmcrZGpLSTV5MlhJdkEveXBOaC9zaXdyRW9DVUlT?=
 =?utf-8?B?ayt4ODBEWlpMZi9YYjNRTyt5M1ZzT2hNL1B6SmFjdVA0R3RYQWcyaWdnWEpj?=
 =?utf-8?B?RGErTzJQUFpTOWVKaUp2ekwra3pzZXBmeHpJaTZucnB3cUpvUjZJbjZEOFRr?=
 =?utf-8?B?bXlNQ0pObWVCcytOZlZVMGFBaXNicngrSjRINU1mcGxGTUQ3eHFRNVpncWpx?=
 =?utf-8?B?SEt2MEtzVGFaNUNTaXlqeHFDc1pnQm4xNCt3OXp1cjJhZUNJYUNybDdNeVJh?=
 =?utf-8?B?OTlDVTc0eDBKTWJMNGVqR3BaSEJlQmttckNVK0RQZlpLWGdRNmF6cUsrQXF1?=
 =?utf-8?Q?oN+M=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TVJBK2llb1RPTDFOV2QwclpWRFlNYVBZdGlJa2ZCcUxDUTkzOFNCbnlnaGFV?=
 =?utf-8?B?dGVpa2ZESFRzVWtmaFBxMnNyUkJraWdIUWtGWHg3dXZNUGNOYUhOSGFnSngr?=
 =?utf-8?B?T0pNK2NXb0JhbVNUQUYyNzJMYmtHMitHTVdyWWpBc1g1dmR5aEpPK25iUFdy?=
 =?utf-8?B?Nkg4U2c5Ly9qZHpEcEhpWmI3UlY1MzJOM0xteCtnQitLbFg3QStEK3pkb0p0?=
 =?utf-8?B?ZWN5SlJJVUU1OW0zK2J3M2hrTkdYTjNFRHlORDAyaVJYSWRMU3FYZG1sWCs2?=
 =?utf-8?B?eXlFaVpyNmprWm1mTkJCN2pubk1HQlk2VENVemsraXNGaUowY0NwZWFuY25H?=
 =?utf-8?B?RWh1QlAzNHRzenYzWnFaenEraEtvc0JvYTd0MXJhcEZPZ3pLNDhqTzNaOWph?=
 =?utf-8?B?eVpPV090K3BKbWdhL2NHa2k0bHRZR1Qwcy9pOVkrSjBBZk1MT2o0VVpVUThM?=
 =?utf-8?B?QjhuNWdUd3FlZkxTaXVFM1FleUUyZFAvMjVqdmdIaGdiYWVmeGFNNit6UnNw?=
 =?utf-8?B?WnVKR0lXSWViakRLT2FpUmNRMVVMRzkxUk12dHAyNjFRTGZIaDVhSUFOS01v?=
 =?utf-8?B?NmJPRjE3K0pDdnA4UlVhMDh4ajF1YzVMNS9jR2R4SEs0SDZUMlduVDBSc2p2?=
 =?utf-8?B?c2M0R01sVG1RMWhhdVJmQ1MrcGQ4bFZlWlI5SVJCY3ZkcWlIbFd1WFMwdytP?=
 =?utf-8?B?OG45RjQvRkdQa2FXZjRDc0RZdUFhM0E2SmVKMUdsRVN3SW9TVjFHdkJEaVJ1?=
 =?utf-8?B?bEFkUm5hdUtpVWphZDZLSUZ5MUFIM1IrZEIyakIzclNKWWoraFJERitIV2t1?=
 =?utf-8?B?UFc5RzQ2RGxVTzhJdWpNQ2Ftd1NQQWdkT1NWdk1ZakZqdThpSjYwM3ljeW9R?=
 =?utf-8?B?bHJheVdPNXlnc3U1akFvekJ0QTVTU1E2QUU3R0dsbmZXcUNic25XSTVtY2FT?=
 =?utf-8?B?cXliUTB3U2NHaGJkRktSTjZRcUZHQ2dEZkRydEdYMTFseG95M1kycXZmYVpw?=
 =?utf-8?B?ZE84ZXB4YUZqeFBBNlFZeElCblU5bk9kU0RjaEsvUkJwY09iTTJnditheWxU?=
 =?utf-8?B?dDVrU0N4QXVUMUpGc0FLNFRJdVFZbVp3OHE1N1NKU0NtdERxR1llbnMvOFBy?=
 =?utf-8?B?aHN1eEROYjZZSWQzcUhQUW5wczE4bjEzamU1NHBqTU90RlppWTJwL3RrM3VC?=
 =?utf-8?B?Ujg0SFoyY0kvWGJzMmZRM294Y2NLN2ZtQ0xPTTl6alc4dHdiWHNYTTVlNndu?=
 =?utf-8?B?bHdNeXhCVjFScXlLZkhmWS84VVVQZGVUZEg2aWUwa0ZHY3h4RmJwNkhpcGh2?=
 =?utf-8?B?N0lPZnl3U1ROajBJMlE1MFRDSytPa0EvSUdUMlYzUVhuWCtjY1B3N3lTdTIx?=
 =?utf-8?B?MDY2Z1JvY2ExOC80NkFZZHZIbmhmM2NkWkRNOGlNRzVJMk5IajhEblZVamFk?=
 =?utf-8?B?THk5Yk1DT2lLOTBGLzgzZTYxMVR2NXBMcmZZRTFRM0Y2WmVDSDNqVFcrRzMx?=
 =?utf-8?B?NU1NV0dadDQrdUJSKzlEUHlQejdyQUpaU1MzVEN1MGE3N0JTRDNJMnJaUERu?=
 =?utf-8?B?K3JwUStZYVRuL0dPNFZDTElpMmlxamZuemRZYkN0U2NXQ1JjTmNkdzZrOTZN?=
 =?utf-8?B?OENmd1ZQWGdxOE9XZW1EYkw3c08yZGZpYjczUWxXTkUrZHhsZll5di9TdCtW?=
 =?utf-8?B?MG9Xd2xTSTNjcy9kaUljczFTNHJkanlyYmdlbzhXVVNTc2lFQmlEUjdTZTlS?=
 =?utf-8?B?Q0N6d3dBb2lGRjNsR0JuUFJPWU0waW9xZm1jSWhIdVRnZ3lCOEd6SEZTS0Ex?=
 =?utf-8?B?U2F4b1JHOHF3NU5HTnVzWlUramN6a0JMZjRHRk5qNlVnL1lHdHVuMHRwUUVV?=
 =?utf-8?B?MlJNUGlTMXpBTFBkNWRaSE00TUtlYUc2dG9vcWFpYnAxSWJVOTVtY2tiMEhn?=
 =?utf-8?B?UkR0cEgrdVNUME5leGZSK1BlaHltSkE3eEQraXBsS0lLenBROTdlMzk3YjhG?=
 =?utf-8?B?OU5MQTJJY3VGYjJiQU90WWd6TFk0eFljYW44WUdxcGNZN1duN3pGV1ZlaWt6?=
 =?utf-8?B?MUxBSEpkM3JDRjNBSlVvQ3VmL0NRK3JWU09CZkd2TzhMdDEvS1Y2OHd1RFk0?=
 =?utf-8?B?YmZqSkRyMEk2elRqbDFmZkxtZ2xYb3VCb24yVFhIVTMxUVN3WGxtcTcwMjJJ?=
 =?utf-8?B?QS9xaUVFNjhlWUxZRGx3bVVacW5PdzhxYVpneDE2OUs3enZvaC8xeE1HTEMz?=
 =?utf-8?B?eFV4QmU4VGVmNXVvZkhaZHJFUzZYMXlnWkUzY3VaVVRVYllhMjBOdWsyZTZY?=
 =?utf-8?B?MXZmd2o5cTE5L2V2ZTF2S2Zyc3J1S25meHZ6bTNnV3RIWWhIdlRCdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aa158a22-028a-4465-c2f8-08de5420b642
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:27:40.7676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKXgxn5MBJESloOfYDuRJ7MfzCaxHkGJYrI1SLRr2wMcDSZ7xbjtWoMJyC+9xnJaUvJ8vr0beHbTCdsZNrCy+Cs95lXKxZzNdw4/hUng+rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7692
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Jan 2026 10:27:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8571

Hi Antonin,

On 12/24/25 5:24 PM, Antonin Godard via lists.yoctoproject.org wrote:
> After switching to the new definition of "Source Directory", i.e. the
> base directory for your project (which used to be poky), mention it in
> this document on manually setting up the layers for a project. As stated
> in terms.rst, use "project" for the directory name.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/poky-manual-setup.rst | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
> index bcda9d7e7..7ee084007 100644
> --- a/documentation/dev-manual/poky-manual-setup.rst
> +++ b/documentation/dev-manual/poky-manual-setup.rst
> @@ -22,7 +22,15 @@ release or a Long Term Support release.
>   
>   Once you complete the setup instructions for your machine (see the
>   :doc:`/ref-manual/system-requirements` section of the Yocto Project Reference
> -Manual), you need to get a copy of the different :term:`layers <Layer>` needed
> +Manual), create a :term:`Source Directory`: the base directory for your project.
> +We will name it ``project`` in the following sections:
> +

What do you think about:

We will name it ``project`` in the following sections

to

Throughout the documentation, we will use ``project`` as the 
:term:`Source Directory`. Here's how to create it:

?

Otherwise, change ok to me.

Cheers,
Quentin

