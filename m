Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1731D41C39
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 13:56:12 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9672.1765461367416999801
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 05:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=E6vbTGh/;
 spf=pass (domain: cherry.de, ip: 40.107.159.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqoxGPdGjWW74ZyP9h9F96i2iexojVumEFliiNbqlYeqClaF9PhYPSOzHQYhSLPek07TfHfeuUej3ziSjwsMbkABH1GIxtl5oWhctqW30R3AL1uidErjrRLEFgLq5RXa2PQQSS5V6uxp9DQLpK4DmQg05i8Dwkg0O6ACB0ndBI2uK5tVXUClaDu+HZp0td0ismNPmCeGFOSTIoeFcEy/wbxZiWaJUG+tf6ZxLv2aG7wyD/Du5LlLj1UcoTTzF/x2goguDoqM7I+M4Sgrwlp6CEUvAQUvkokjh8zURtMVk2RAkRQlvgBRDxI+tANBiyKEFFdZV9ptErIU6U6apJXcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlY6tbhNZ0uq5AK9CIFKYDU0djzriDW6AHVlomuHiVs=;
 b=X3gSzx7FO2KGPQOz3U/lP8abFVQOnUTmDwH81yHTFjYMvurBFQvddDVxXgL/qu/85DzxEqQVaFAkPmrLDUKTDiswbumOFq6qZVBsduwWskCdUkk4YV9RIT2qCFs/xUaqPPHNKeUSxnrxX2HG4fBpRcNz7s7P8FkAAadE8Bni7TjLOocbATd8a7gyI6B1Ih9BkqrvQTaxJ814uBtPSxqoTtWMOIKbvjWum3ntIk3wWBYzOJUviM5UunkY3wGx7zGOQvfPiPwxt8vOuSHIF5GXAdLWK8SedfV5dC9J80ym/zhEnewi2/G5ITapOPVkFi974sfpaTiGQoZ5+lBH5XV/CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlY6tbhNZ0uq5AK9CIFKYDU0djzriDW6AHVlomuHiVs=;
 b=E6vbTGh/Fecdn98yKla1rwzJ6tPlIDy0OdMYHCzcQRS0lMAtha6PaiiX1IEYcUPw73KAw/2/tIhcwmdaHONShcKfdQoPqxu+Stkewaejz7+Qnl5vIiPs/K6hWd2Ig1AVFHv7XHf9ok7NyIdr6r7mLNMIMOctrby5d2lTVjPzXV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU2PR04MB8550.eurprd04.prod.outlook.com (2603:10a6:10:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 13:56:01 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 13:56:01 +0000
Message-ID: <a6f0fd83-fc5d-4828-bf3b-66695d9ad807@cherry.de>
Date: Thu, 11 Dec 2025 14:55:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 4/5] ref-manual/system-requirements.rst: fix
 AlmaLinux PDF build
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
 <20251211-build-docs-container-tlmgr-v2-4-58719c103a50@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251211-build-docs-container-tlmgr-v2-4-58719c103a50@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BE1P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU2PR04MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b6b07ae-243b-45dc-f470-08de38bd04b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a3RHcU9tZytGUkUvbWxzL3k2TnZMVDk2OFNxV2JXL0xMNVdRRFVkZ2RudEN6?=
 =?utf-8?B?REJxNUtHUmc4MXB3TXQxRDByVnlXdDJkczhqeGE1UDFRbTdxUnliSDhjY3Rp?=
 =?utf-8?B?ZW9DU1U1U004V2dMUVJhRkN1RzF5eFAzQU9Hc3NyaWkrTUZEd3dYeVpITWh6?=
 =?utf-8?B?ejlYUlpsRm53cXlGSVBrcEVGcktEa2lqbkJaK1F1M2ZLM2RPOWtWMExmK0Q2?=
 =?utf-8?B?eWNsRzlXdEZYbjhPckNKVnpwSGwrMzVpbjhHSFBJaEdIVTFVbXk4aTVWVUZS?=
 =?utf-8?B?SUx4anBVbFZ6NVllYzZvaWZLVXR3a2JLaGlXUXM5MFBsa3JhaVZMdmYrbitU?=
 =?utf-8?B?YUdhczEvNHVqbm1QTU9mWmptbm5VLzcvUmUzelRxZnhJbzRWY0ZHaXF2S3Fp?=
 =?utf-8?B?ZXRSQWd6TUc1NktvYTlOeUUzMlJTMS9IU0pnOU4yY0hRQ3F1NUlBbEZ2YmhW?=
 =?utf-8?B?TnY4eEY3RkJ2RThFVkFuZU9ySGUrZnc3QzUzZFI4Nk4vYURDL2hpLzF3SkdW?=
 =?utf-8?B?TlI0QWJZQU5CNXEyNkQySUJJbnh3WGI1MVk1MHNyRG8zMFEyaEhBTERCeVVW?=
 =?utf-8?B?R1AxRnd6R0oweTVQdTdxNTd2UW44U3NPdXU3bmw5V1JQcUxyNUxKSmJnMzlT?=
 =?utf-8?B?V3FyMEVieHY1SlRGZlE1ODVqUUNlUDhSdGFZNWpvZjYwSnJrVFV4WExVMWds?=
 =?utf-8?B?R0w5M2xKVjErSHBnRzVML1BnNGNCbUtSaXphVWsybkpkYWxlMCs5cUdyVXR5?=
 =?utf-8?B?S3ZwVUVEdDRuUDFReWc3aFUzZGlYUjZ1VHdzUnR0QXVHbk5zeHVDall3SVZ1?=
 =?utf-8?B?ZWMvZVdQR3F2bWwzLy9aMktZS1JaREw3NmpyRlN4YmpMcFhhZjZPaWhPWVdz?=
 =?utf-8?B?NHR2RVVuekVrQTByV2NQSFd1VXpiY1c4UDNQSENhTERYRmNScmt6NXJvcGxk?=
 =?utf-8?B?QnZZTklKWlZidmRYcVVYd0N6V2JMWGhjc0dqRGN6RUpnM2twbW9rMnhaQ25G?=
 =?utf-8?B?RlpFZGg0cTE5dFJHKzN6TVVkNFBOc2h0ek05MCtpZUNvaGZTQ0lqWlZycXRR?=
 =?utf-8?B?aXJBc1FNQ0FqRlJHSE9hL0MzZjFJbUxNeTFIR0dKcXBWeHhpWGhlNFhiamly?=
 =?utf-8?B?bzdSWUNEbHpla202N0xydEtmSU1VMDlHK2xzb0JaU3JiL0svV0dqQmNtZDI4?=
 =?utf-8?B?dWUvMmo0WnRzcVAwVnBxREtpRkZ1WEwzRjNZY2Z1RUxvVlRSaVpWTkZjdTRp?=
 =?utf-8?B?K3FNWmVuTmswdDN5ekFYUGlaZjZrVEFOeWdyZFVpRUR1ODJEVUxTUlZKTnNK?=
 =?utf-8?B?blFwZ055WlVQSlpaY2tQZk40aThyUU0yQnlibW1oWGxOcnNkOXkxTUlnM2wz?=
 =?utf-8?B?RmJIYmYxb2Z5ZzRaZ2tWNklzeG5XMGtKejFkd2FZQkdGaW5od3dNUmg5cFRK?=
 =?utf-8?B?TCthMUpoT1psc09NVEJpemdGWHB1L2F0c2g5dWRsWWtRVk03R2ZiVmVpY1dn?=
 =?utf-8?B?ZkEwTjdoNDVRcHY2N1o1VlJ0elZuVUxQdmljVlgwSGZybUlHOEdTaDVnRnpG?=
 =?utf-8?B?M2NPcXdiU2xpWHZXRE5FZmQ5VGwva3lxakx3TUM4cG9xMDRWb0l3VXk0VzdH?=
 =?utf-8?B?OE0vYmw4dGgyWmRMb09xR0NPaHp5TFJ3MitIbW5ab3dseXJxQWMzYkxpN24v?=
 =?utf-8?B?TTd0R0dkU2Y2ZmhKVUQ3eEdCNGhPNzhrakdObCtxNDdmNFNjRm5qSG8yYXcz?=
 =?utf-8?B?YnAwMkllZm5tcEYyN1llemRydFhNajVRWVo0SkE1N094WTBtNkZQSzNrNy9i?=
 =?utf-8?B?d2hRREIrM09lZmdOQ1RFUTgvNHJFOENnYWV2Y2l1allGNzJLamk1ejRzRTY1?=
 =?utf-8?B?ZUQrVUJveXFTKzhIRmdqUUxRT3dUdlM2c3I0ZmVMYklRV1hQTnhoV0VUd2Mz?=
 =?utf-8?B?YVFDN3IreHUyUmRBRjAzTGxPb0grQ25ycDRKVVFueFcwNWh1eWJHNXJ0bEtK?=
 =?utf-8?B?YVhiQVBSdmlBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVhWdDBlcUlOUTc4aWNoZ1dTTkdUZk1ZWkxTcDR4bzdvb2VFY09OY2M1VlRh?=
 =?utf-8?B?NzkvcG5aVTVzWUhZQU9VazhPenhNQjlsRm1pVnVJSWlTTWQ5Q3h2WURVU2pJ?=
 =?utf-8?B?TFkxWXVTNFpJck1CelBwd2FveVFJaWFCeXBlRmdjYkVaUFRlWStHNkcwUzNU?=
 =?utf-8?B?cUljbFgvQ2V6Y1ZuQjVLMC95bUVOSGFvSUxVMGhsTWhLK3k4MWd0MzBDU1JJ?=
 =?utf-8?B?aUxOTkpkQkF3bnFSdUQvRkFHUGZXZGpiN0REZFVIR2Vhc0hkODRnOWhkSUdr?=
 =?utf-8?B?N1lLWDZ3Tk4xN1E5b2pIeldHcXJ0T2hEYi8vb25HWTRFSDgrbXpKWDBmalA2?=
 =?utf-8?B?TU9ZZ3VRYnpxOVR3SUg0VWVNb2hFMFA3cklBM2xud2R3MG9zaWxKeEtpNHJF?=
 =?utf-8?B?My94bUpwYUZNK1ZyOGlJc2Y3ZDFrbWcvb1hJcm9oeHdwdHZ6U3FlamdEbkpR?=
 =?utf-8?B?SWVMdm04cHV0Y1NodnNwL2tRYjhFNXJNN2lvcnhnZFhHMyt4c3lmVGdXb29X?=
 =?utf-8?B?Skl4TUJ4M0NOZ004SkxmRUdxL0o5bGw3Z1dvWTRuaUEyaW9ydWJJOGJMaWdj?=
 =?utf-8?B?NHg5QUF0QXg0R1FPdWJzUndjd0lqeC96ekptSTRWTDczWjdQUXdtUFFWbWpu?=
 =?utf-8?B?TEhXQ3RMZTAzcWJVeXNFd3NHYklNMGlSeWRzMmt4RDlWRXIxY1dObkZEejFa?=
 =?utf-8?B?QTNHdWc3WVBtbW5peVh2TG1XaHhwZUF4Q3V4Z3RnVzhNRXpPUGJWYnFKZnU2?=
 =?utf-8?B?UmZoaUFmaUtNZ212a0c1OHpoeWVxa1ptVjIxSE1qOW9RQm1BMWFYcGJzYUly?=
 =?utf-8?B?MkkwdmZxNTNhVit1ckFNWW56RFl5V1V0UlFwTlRmQ0h5MlpuTGZRdHo4TFRj?=
 =?utf-8?B?ck5BbDNNVGZmeXVqb09GNEd0bTRTREJZTzBkUVhFZ0tHVHNUVlRtYXVDMkR3?=
 =?utf-8?B?WGN0MVFPNUJnaDZQTXZYdVVTRDI2Y0tpQm9CKzA5MnBWSXIyRDNhMFVXaDdp?=
 =?utf-8?B?ZFl6VURjUTZFRmVNM1dub1JHdUpwTmg2bzR5MlQzQ2lFWGsxdDM0a2Q2TmFM?=
 =?utf-8?B?NVlzbjhtN2tJbWZrMzFlayt4OGdOYk1qMFdkaXlsSmRQTGlNNmhTVHh2WnQ0?=
 =?utf-8?B?Ym5lRElRc25jbllSdUFQd0hOVEVvK2pJMFFtTFQvbTNwTTNRdGJYVEdiTmFF?=
 =?utf-8?B?eEZLSDg4UzFMa2pFZmF5K3Q5R09VRXNJbXZ3T0wwMmhTd05wcDEwTXVqdFZX?=
 =?utf-8?B?eUdJbGFhTVlhWi9wUHRudCtJcCtmMjFxUk80MEpZYmxvR1loUzlnUVQ2T1JR?=
 =?utf-8?B?VzVGV2F4ekJRUWFkOVh4T1p3MWRXZlFUUmplbTdGazUrNVhCelJkTmtFUzRr?=
 =?utf-8?B?S0tVWHlsMDdhZXpFUlVBMU0wMUFkb245VGhGRHlsWTlYbTYzS1oySFFUUEQz?=
 =?utf-8?B?TTJ0eXpSSTRHSHM3OXBkMjZUVGROR0tXNCtjczZxazlmN2lXVDRsNDA1MDRt?=
 =?utf-8?B?Z2pkS2NpelV0QkdGeWtJT0ZNL3RJZnh4NXBPWm5BOVhJMGZXa2dFaFIxNnhh?=
 =?utf-8?B?YVF3dmZWb2JyNUlmZFlMbFV0Vjh0NWRQWEQrb29DSGtHV3FDeS92eEYybWxJ?=
 =?utf-8?B?WjREdnp0RVR0VDNUUDd3UTJuMlVneWhoUGxkYW1VU21KQk9GZERBMVZiWXRB?=
 =?utf-8?B?NDdNa0ZrOWkrdFU3RCtzemwxcFRSeEFQaFJYaFdBbTVkdm9WQTBLNXhmUkJh?=
 =?utf-8?B?a0dxVW1xaWpyVUVic1psSTRFWFdTM25BR0VWT2Ivc28rYlZxNGdYcTNhbEVZ?=
 =?utf-8?B?Ym9ZRGFyb0xkcGFESTF4ZWEvOHZ0TGt3eHdwRUVOSVA2aGoydGZ5UVJaN29C?=
 =?utf-8?B?bVMrMTVWSTYxK3lXTjl6RDZtWUw3TFUyUWNwWDczMXR5VUo2c09YWTZkakpQ?=
 =?utf-8?B?NXNmVlhPOVU2WnJ3WXI2bjcrQVBEaHcvWGNGczJJZElhaG9JSnV4aVJWK2Rn?=
 =?utf-8?B?dWhjQXNONVllOURKMnRXTmlvQ1lqM1c0QjNPZ3BkOWpIbk5ENUpyaC9kRnVr?=
 =?utf-8?B?L2hTUC9UVU45eERUTFFITEtzalNpMlM1SlFKa3Rtc3U0K2djcWxUYThJVE9r?=
 =?utf-8?B?SlVPRzNpOVEvczZUQWNWdHNOS25RcG5yekNkMjZEMXoxQXdjMEpqOTQzakV2?=
 =?utf-8?Q?Qt95+vVC4Lqv/L5+zL/FKVw=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6b07ae-243b-45dc-f470-08de38bd04b8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 13:56:01.3272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57/tvGlvsfWrinZxVUHpoP2h0WFFkSehrWpgE+pIwY+vbObbISDE/mqlVR+easVBlttVozUTGp4yT6GPkKpr1R6RWPsAf2rI6UBCiaOXMWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8550
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 13:56:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8255

Hi Antonin,

On 12/11/25 10:06 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Use the new tlmgr_docs_pdf.sh script in build-docs-container to fix
> the build of the documentation PDF for AlmaLinux 8 and 9.
> 

This should be one commit...

> Fix the almalinux_essential.sh script to either enable powertools or crb
> depending on the AlmaLinux version (powertools for 8, crb for 9). Pass

...another one...

> -y to dnf install command (otherwise stops when building the container).
> 

and another one.

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/system-requirements.rst    | 21 +++++++++++++--------
>   documentation/tools/build-docs-container            | 18 ++++++++++--------
>   .../tools/containerfiles/Containerfile.almalinux    |  2 +-
>   .../tools/host_packages_scripts/almalinux_docs.sh   |  2 +-
>   .../host_packages_scripts/almalinux_docs_pdf.sh     |  1 -
>   .../host_packages_scripts/almalinux_essential.sh    |  6 +++---
>   6 files changed, 28 insertions(+), 22 deletions(-)
> 
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index e9d5012e3..4063253f7 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -253,18 +253,23 @@ Here are the packages needed to build Project documentation manuals:
>   .. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
>      :language: shell
>   
> +In addition to the previous packages, the following TeX Live packages
> +are needed to build the documentation in PDF format and can be installed with
> +the `TeX Live package manager <https://tug.org/texlive/tlmgr.html>`__:
> +
> +.. literalinclude:: ../tools/host_packages_scripts/tlmgr_docs_pdf.sh
> +   :language: shell
> +
>   .. warning::
>   
> -   Unlike Fedora or OpenSUSE, AlmaLinux does not provide the packages
> -   ``texlive-collection-fontsextra``, ``texlive-collection-lang*`` and
> -   ``texlive-collection-latexextra``, so you may run into issues. These may be
> -   installed using `tlmgr <https://tug.org/texlive/tlmgr.html>`_.
> +   The Tex Live installation above is only valid for `x86_64` hosts.
> +
> +Before building the documentation PDF, setup the ``PATH`` to use the installed
> +packages:
>   
> -In addition to the previous packages, here are the packages needed to build the
> -documentation in PDF format:
> +.. code-block:: console
>   
> -.. literalinclude:: ../tools/host_packages_scripts/almalinux_docs_pdf.sh
> -   :language: shell
> +   $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
>   

Same remark as in patch 3.

>   CentOS Stream Packages
>   ----------------------
> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> index 0800c4333..9d1bfdcdf 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -33,6 +33,8 @@ $0 OCI_IMAGE [make arguments...]
>   
>      OCI_IMAGE is an image:tag of an OCI image hosted on hub.docker.com. It is one
>      of:
> +     - almalinux:8
> +     - almalinux:9
>        - centos:stream9
>        - debian:12
>        - debian:13
> @@ -84,14 +86,14 @@ main ()
>     version=$(echo "$image" | awk -F: '{print $NF}')
>   
>     case $image in
> -    # Missing latexmk texlive-gnu-freefont packages at the very least
> -    # "almalinux:8"*|\
> -    # "almalinux:9"*)
> -    #   containerfile=Containerfile.almalinux
> -    #   docs=almalinux_docs.sh
> -    #   docs_pdf=almalinux_docs_pdf.sh
> -    #   pip3=pip3_docs.sh
> -    #   ;;
> +    "almalinux:8"*|\
> +    "almalinux:9"*)
> +      containerfile=Containerfile.almalinux
> +      essential=almalinux_essential.sh
> +      docs=almalinux_docs.sh
> +      docs_pdf=tlmgr_docs_pdf.sh
> +      pip3=pip3_docs.sh
> +      ;;
>       "centos:stream9"*)
>         containerfile=Containerfile.stream
>         essential=centosstream_essential.sh
> diff --git a/documentation/tools/containerfiles/Containerfile.almalinux b/documentation/tools/containerfiles/Containerfile.almalinux
> index 7237e9b99..5430d17dc 120000
> --- a/documentation/tools/containerfiles/Containerfile.almalinux
> +++ b/documentation/tools/containerfiles/Containerfile.almalinux
> @@ -1 +1 @@
> -Containerfile.dnf
> \ No newline at end of file
> +Containerfile.stream
> \ No newline at end of file
> diff --git a/documentation/tools/host_packages_scripts/almalinux_docs.sh b/documentation/tools/host_packages_scripts/almalinux_docs.sh
> index 8188d529a..dfb201fe2 100644
> --- a/documentation/tools/host_packages_scripts/almalinux_docs.sh
> +++ b/documentation/tools/host_packages_scripts/almalinux_docs.sh
> @@ -1 +1 @@
> -sudo dnf install git glibc-locale-source librsvg2-tools make python3-pip which
> +sudo dnf install git glibc-locale-source librsvg2-tools make python3-pip which wget

I don't think wget is a requirement for the docs (the non-PDF variants)?

[...]

> diff --git a/documentation/tools/host_packages_scripts/almalinux_essential.sh b/documentation/tools/host_packages_scripts/almalinux_essential.sh
> index 76c5280ee..9564bb4fe 100644
> --- a/documentation/tools/host_packages_scripts/almalinux_essential.sh
> +++ b/documentation/tools/host_packages_scripts/almalinux_essential.sh
> @@ -1,5 +1,5 @@
>   sudo dnf install -y epel-release
> -sudo yum install dnf-plugins-core
> -sudo dnf config-manager --set-enabled crb
> +sudo yum install -y dnf-plugins-core

Interesting that we use yum here and not dnf?

Looks ok to me otherwise.

Cheers,
Quentin

