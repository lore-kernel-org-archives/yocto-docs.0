Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DD2D25B7E
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 13:48:43 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13545.1769608113137488312
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 05:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=D8+XVbyO;
 spf=pass (domain: cherry.de, ip: 40.107.162.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBmXfZhKDqbO6svl6VfF/7xYiAxqeuLOfAEzQk8I54WxRSu+PAeUJM6klLJNNynh5orfU9BCv2sLrMZZKbQHCkUiIQaUwJRXJrLSUgS9ZUx/Uc9rr7mLMtGll7CriDMmYJc+9kbd1WChDevwXWa6jR9C5UOcBUeDGKmh6Y3IaGWmkaQZC5KvtQKk33+y+8onda4KhaSsKGiEtX6VAV1PAkNzmNrpBWdncIdCJmLEPgx7iHbzCemiQQWT/daJvBLTBwckt0392Z39s+Uyc4R62yWluZk38jeL1jNTXMWZq7nC2Dn+/Sls7zyhvuR3/NagZ2DkTO8wdQ+wBLcndjf88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFdK/cOkTKrAP7oH0nVb2ZY3Mz6kO66vV3n8bdfvtDU=;
 b=hrA2iDcQRNGoZM7tgfEeKY21b1B1rTc9nHUHAHygdz5AeJCzYy0VSk/3jK6VyiBILuU4EVCnTWsaYNC62w/WiukNBCHTWLEqvm8YwJv6f7V+5LDU1/ZOeuy7V9+cUnnXEOaUrYx+AcoLyMGrqe2APBAyIbZ9AgEycxOqbGD0wD3yqq9HC1uOn+1t5YHkwBDEGSJAPfppzblqu2AlrwsQofusdIu9AQEV6KVEcqFXyCuNeg9VR+U6hOdYrYU3+zAsiTdHyZpQx+tQ0KMuqFlTRt0zSl4TnZASW5vGvnTLn0SwqUw2jfwSzytJ7o/SsmJbDtS0bWAPFPA2xWochb93uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFdK/cOkTKrAP7oH0nVb2ZY3Mz6kO66vV3n8bdfvtDU=;
 b=D8+XVbyOEt9ps6p2fhVgCKItLjl/RDbUQrmw69rBajrdkFUbyfZPM/r2KV29yZhmjKqvr5/paIpAMtvC2QjNnerohXN3j4TGDfdSCz3xxddIy77ZC6KpCnftpWVa9m+/UoNv95a2fP7VKZfq2CjdjE0T09YcWFfMeTpPLzbrCrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB8117.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 13:48:27 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 13:48:27 +0000
Message-ID: <2f5c2f53-af90-4c11-bcf8-d35449efbcdf@cherry.de>
Date: Wed, 28 Jan 2026 14:47:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 37/56]
 dev-manual/custom-template-configuration-directory.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-37-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-37-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f530c0f-002e-4421-616a-08de5e73ea18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?azBoRzlVazNmTTZvOE9BQkQ0eVk3TVVJOEppOUlTUCszVURXQzNVTU5pWXQ0?=
 =?utf-8?B?T1MzVEdZcCtiQlRiazA0bzRQbHJvcEdiUDgySzArU1V5ZFJaL0dkNkJrOVA4?=
 =?utf-8?B?RldWdkRJWWVEd2NxSGtTankvRlM0NnhQdUpGOGdlSjJzYklkUnZSNzFMTGV1?=
 =?utf-8?B?amF0UHFKQWFSSDJpRHRENUd3OXZkc0ZXQUd1Q2pUeTBvK1BhNlo4ZFBBUFNt?=
 =?utf-8?B?NlNCN2wvVzJuWDhZQm5vemdCMEZPZ1gwQlJGMExVb25ObmpQcHROanRYWVVx?=
 =?utf-8?B?SXBpSFVvSVBWZ1NpTjRyekZRbWhieFJHSzE4WXYxbEtuWTNWRUlIMVA3bmxK?=
 =?utf-8?B?aVZvdjA4bWdQM1NYTU1oWWl2MzgvSll3MzJSWUxGZTFvbjJ1TmV4QTZHN0Jj?=
 =?utf-8?B?MGErTjhZRXZMS05GbHE4TklhSWpKUjJKYmFuWTVmUCt1d3lvaFhjbWZnWnR5?=
 =?utf-8?B?eG5zUmlpK2U4emhoLzczMkFrUlE3TEd0a0Zya3JUQlV1NTU0M1hiNnpMcjFq?=
 =?utf-8?B?R2x2ZGpNaU9peUoxdXRRQk1zbmVGM0J1NjdxYzdha0NybjlCa0tFVUxwQmFm?=
 =?utf-8?B?eHBuZ2lxZkRoTlRyUkRqMGRkSHpvTDk0SEhSS1FsL1ZTZmdQVHk0ek1GREdY?=
 =?utf-8?B?OVlkRCtIdUUyOElYOFRFQkxmMFQza0t6dGQ5alpCb0wxQ21JVDNYdFRLbjFt?=
 =?utf-8?B?Z1MyQ3p4WFVoT0FLbzhRTzJOM21hOXRBL0k1SXpNb0ZjY0REdzdYSUx2dXNU?=
 =?utf-8?B?RVFVR3V3VWFKa0hLWGFDeG14MWJWOFZkQ21wNHRSK2RHTE5KeUY0V2NvbCs3?=
 =?utf-8?B?TDJZTDhBeDJMUUJpNUd5Nm55UEZYbTRDVXluM1FuTmxPNlNjZ3NpOU1Cd1Yz?=
 =?utf-8?B?T0RsSzlFVVJxb2U4UDdYLzVRMFlsdHBxd1ZCVkExL01mOFFsNzREaFhIN3hz?=
 =?utf-8?B?V3F4R3hDNnc4Ujh5bTR6UHZ0WEpWS2E1ZWpXV3lQTDNBQ0REOFdBR3pBelN0?=
 =?utf-8?B?Q25YK0xzZy9aY0p1aXBzOGdreEFLcUtaa3huTnIzWUNHZkxadEl0dWpuMFVr?=
 =?utf-8?B?dmFWNEQrNERnWHhxay95OVpsT25NSnAyQWowZEZqa284enQxMGFKNlF1bVhv?=
 =?utf-8?B?b0JMbzhiUGVEV0ptWFpMTG51QVk4azVnTmZMbzdPNXorV0dRVW9XYUtRVjNS?=
 =?utf-8?B?cUlyWlMyNldXQ2hvSTBHUzd6VnNvME9UNU1VbldZYXp1alJHUjdwL3NLMW52?=
 =?utf-8?B?ZDBIVllST3RYVjZBeTRRL2Iyb01tVG91NFZoK1ZBMUpuM3A4Mm9Hb0NnMkh5?=
 =?utf-8?B?TElIaDZsalJRcGk4cndiVGxJZ0gyZTg5R0E1bHFyVnczTkZraWRTSTRZdkt1?=
 =?utf-8?B?cytXbTFPWlVEQ0ZkM29mTnd2K3lRZkVCcEUySUE4Y203Z0VCWHVQZitJdnVr?=
 =?utf-8?B?Vkg3d28wKzZFWDRqZTI4YVNPdktCWDZTQWZ4d3M5U01jZnNsZ2RVL0ZnUHBm?=
 =?utf-8?B?YktBOTFFdFcxZDFHMncxZHhoaGpWYXAreDlkK0NpY3Bvckxkb0cycHQ3aGx2?=
 =?utf-8?B?TS91YjRNeHp4VWVYVjZNREhjYzVnbW0vWk9tejdOVHlpSkV0OVlENVFtUVhC?=
 =?utf-8?B?V24yQ01uNzh1K1NIZzk3Q2ZDM0VpZCs3TVlJcGUvaVU2ZHdsbHpubVVqMDdI?=
 =?utf-8?B?amM3WGZHYjVQZjVCMXhWYXJybTNsKzhpenBnS01hVTY3YjNNS3hvTm1EV2dO?=
 =?utf-8?B?NFlyZVdsUi9zK05zRzRRRDJVSGxpbU1HOVd2WjRiMytucEw1ekkzblpYV0xX?=
 =?utf-8?B?TlpBdDE2bVdQbjRMdlFLV0F1Q3Fqd1ZrVzNhL3o1c3c3dUFjWkUzLzB4NFNU?=
 =?utf-8?B?ZFlCbnVNUWdPVEIyVXlHQ3g1dlc2RUU1ZXZhSXphWlk5c1F0QW1lS0s5Tndi?=
 =?utf-8?B?Y1U4WUZMUTUxeVExcnh0K0xGaEluU0IzYnJWL2pRNG9hbFBQRWI3bGE4czRv?=
 =?utf-8?B?bVJIb3Zqdzd2UWNyYVVNOHNyT012QWdCeWNhLzhhVGxRU0ZZZnIyRjhNSXQz?=
 =?utf-8?B?c3RKWkdaSjltd3kwVUora3BYWGpmR3hlSmlYak95Q2o4VTVEVEFOMDNsMGtB?=
 =?utf-8?Q?421s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cU0zb0plQ0FBdHQ3MEM1cGZVbmhIVXp5aGQ0ZUlnS3kvOHV0THhTOXJMNE1V?=
 =?utf-8?B?SWNGSUpZOVFTa3hoTkh5S3JSaGErdm9jcXhobFZDdVh4T2pOa01HeEo3aHZa?=
 =?utf-8?B?RmY3N2FTT0xpbDVicUNPaEE5R3MxalN4VGhrVFY2M21YbTNBaXJhaHBaZmY3?=
 =?utf-8?B?YU5CUmNic2Q0SXFRMlhQQmJKTjNDdDdlaW91UkVoMTFaK1Y0bUJkd2pEdzBl?=
 =?utf-8?B?Lzd0b0U3dXU3MjBRdEtwMkNHa0hEM0dSeHY0QXAxeE9ieXl6d2FQQVRWZC9T?=
 =?utf-8?B?WVQwenUyM2hZa1RIemJOcVVTOUdUMWpiZXRSR3FuS2xQUEg0cVFUMUQxRk5n?=
 =?utf-8?B?TUwzYkVGQmNvdmxqVDBlRkpNU1Y5QzI0aDloWm0yWHdES245TmZyS1BsL2pQ?=
 =?utf-8?B?cEYxZXNHbzNnK3NTUUtCVXR0UDJYTXZNeDViS1F1Nng5YzBSZTREOUswZlBa?=
 =?utf-8?B?djZCQk5YTG9USHZCQUllMUp4bkthVEhyNnF4d0NYMkxWMlAwOHU1OWFCempu?=
 =?utf-8?B?STlNL0NhSjZuUmdtcThlTUx0QXdiaFYxRkdQK2o5aTc2R3ZzaFBlc1Bld2kw?=
 =?utf-8?B?ZXVYdEkwNkYzdFN5cUhQUFlpRGZ0djBwNWRVRUVYVDBTRklJWjV0R1BVT0sw?=
 =?utf-8?B?VVdjVG9UcTF3dytYN0ZncFducm5kdEpkOGVYNVNGQjc0d29YclY2cHRzT3M3?=
 =?utf-8?B?UDZ6WktpL1NWQll4YjJEZWhPYk5oR0FnTDB2V1hMYXg2cHplZHZ4UVFLWHZo?=
 =?utf-8?B?VnZhcmJCZFlIczRCajhMbTlaNlhrRk85Yi9QRTA4MHA5NFdVZVlldWpxSk9U?=
 =?utf-8?B?Zi9pcXlIOUU3Y3dWVy9ya0VXSVlpZ2w1ZmVKWWpoem1tMlJySEVyeFFjNWda?=
 =?utf-8?B?RU42OFMzRDduQVBCNFVTRTc4QklsQWZGTEpDKzluMkxIYWtBUjBQRmNkV1ZC?=
 =?utf-8?B?YnZiajFPdFRHU3hGQjQ3bGFheGp5cFdhN3Jlakp4d3JmWXB4ejFvTUJjeDVT?=
 =?utf-8?B?QkY5OFlrYVFYdGlxT09FcGlVaVdsZHRYdFdBZ0tSSzh3VDFDK3I1S1dubUN4?=
 =?utf-8?B?Z0FJQjBQOVVtckJIS2dvMnY4UVZ0MVhmQnJ2ZmphREc1cGlzN3FPeHJOQmNO?=
 =?utf-8?B?RGRFcVdRTXkvT0ZURVFBQXlrOGlrWlMzVVVobXh0ZG80eXlVMWY0akFnYVhR?=
 =?utf-8?B?N0E1MTcyVzJNdFZBWVU3Q05jckpFZS9ZVXJ2Sk1lSThHQ0loRWtDSkg4S05n?=
 =?utf-8?B?dkxja1Jpbys2N0xIZE8xVmlsL0R6UU5jVW9aTnZ5SVA0ZGVlVDA1S3FQRHRP?=
 =?utf-8?B?Qm9NNzFhODBzUnpEdmNnMzhNZUhUajYxNEV4NXB6VFZRWDkvMlc4QTBHaHYw?=
 =?utf-8?B?dmFUUFpnY1I0TGQrOHN6aDRrdTFPWGRYc1ZuVXFRM2tUUHZ3NWRsOFNHY3Y1?=
 =?utf-8?B?a0V2M1NzU3RFRlQ1enYvQXJwbTY2dTVVckZTMmM2b0NNdlA5bnNwRmpiMUxp?=
 =?utf-8?B?ay9YNU05QmpkSGhCSWJXRTBEYU1KbEROdnNNdWVBeWRKRlRNZEh6WlU2c2Nx?=
 =?utf-8?B?L3JscmNhbFdKT2N1RVN0Y01FZ3Y0bEpET28rdUJUMFYwVW1jcHA0MzVocnQz?=
 =?utf-8?B?bm1Panh3bnV1c3ZaT2srVFZtUG9Udm5MUE1qY0RXVk5zOEs5Y01YRzYxOTkv?=
 =?utf-8?B?bktBR1ozSU1RT3hrVDdNWTkweDQ0T0V6N3ZpK3B5WjBnUVNTMFl0enNiKzBz?=
 =?utf-8?B?citpUWNhbEtqeWNyVnpXcXUvMlhNUDZmQkYxbi9XL0N5QjhNSTcza09GRUtv?=
 =?utf-8?B?b2hSTVJQVXVicjhSRE9GTHA4WmtaMUJEdTV0aWxmKzk5Vlo1TFRDYjREbUpZ?=
 =?utf-8?B?UG5udENtazRaV2hEK3cxWEpodDJxL2QzWHJ5bm1uYzRWYmk1VWhIbmFiQkhC?=
 =?utf-8?B?YVVvTEN2a2ZSd05UeUlXUDNVS2tzNjNHMFJwVEJwSHBzcHpqUGdGUjF2WjlO?=
 =?utf-8?B?bWlmUVVTRWlwSVlvRmxxeTR6MnM0cGtxY2cxeWNnWG02WkpFTUU2eCtjcjFW?=
 =?utf-8?B?emJPTWtlSTNwdUFLd1AvR1VRMlE2UFZvWUswMmVzTTZCK004Q3dWK2cvRUo2?=
 =?utf-8?B?NVY5VjZwZitmOTBHVjZMQktTOUtHS0hMZSsvQXNuTXJhaGFnNFRWV2dLVk5p?=
 =?utf-8?B?Y2YrbVhBclUvUndVaGc4eXhJd21CRnFqMmFaTXVQWERLTkRoWUliM2ZZaDEv?=
 =?utf-8?B?ME1zQU9EbVJoamp5endKNlE0SCtBcURnRUl4d0FvTitFUStPY2J4SDRDRU9S?=
 =?utf-8?B?RStBdWZBTzFlOHZ6RzZjdWxQVGNvUHdSVzVmdWNlU2xDWDNiYVFuYXk2Tnpj?=
 =?utf-8?Q?iXdZjFPs4Ek9cwqGIT0gBZmwFwPmC6IMA0mvN?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f530c0f-002e-4421-616a-08de5e73ea18
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:48:27.6822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0otGZ12J8xWfKM421SVZKYqTUPjmND+tR1yjoNHnaFqwCJJ/es9Pwt/rgqMsSsakxq9rgD9dxHzvmoIGhcGR0JMpC8eCsFLcMT9D3lLXjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8117
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 13:48:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8763

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete. Adapt
> paths to match to encouraged Source Directory layout.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

