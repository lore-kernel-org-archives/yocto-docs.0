Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5A3CD98CF
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 06:25:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123721.1781504690390036498
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Jun 2026 23:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JJrV7Alm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=062669d7a8=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Ntvk216469;
	Mon, 15 Jun 2026 06:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=dLp/MHL5l
	aFvhTEMhWR3mUEYVlchWbqLLvWR8GQjy9M=; b=JJrV7Alm/tMM6c/pjaCat7dLp
	lNUn5QIeFcwWyIHErlAoqqOE9ku0oswestncABEpO7+3xIhTn82FkU4dWiI6lbzc
	MVTKNsX9Y3mDApDhBHA+vkf2vNEZpH0RTE3DpgHiAYpMELI4PYZv3/07ByYKSUzg
	bzKuLdXcCIWJmXCpbYuD8e4dFERhmiHn1GHaJLwzszed2tS/4++3AraGkrtMavnW
	jucZ6imXR0vf1ZUJvCZoZjno7sl9hIVMolgBF/OKBDgMbyEyB8T5K9Da3jWIZTTh
	29c04noRr+gCQjeO+GWAp0I13EDhC9BB6KPJrKT35KatDRxgRKN3kWSYmRkOA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012015.outbound.protection.outlook.com [40.93.195.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ervkp2bvm-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 06:24:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5nUKXy3OdsfIUHz0J2N6ogetqkzpBLqJyEvJKxYK7J70Y2Yx7IADZEhjKdJyq3UQ25U/wfdpTfLCaq/uPfO0OcCbIYF5gvnw1yqE+vj/6GxKmgeWYe+69lpUZT6QU9FXkEJYCoAvqtKpcuRxz7n0dMfEEYvuyqlpTasLLh05KbsGxOVtLAXHAitTZGJwj2vCQ1ILI4Gg0eTepxF5nBjErGl+aX9jh2heQ+dks5vztHP4xoyfSyfylTa+nFfWe72KW7JtBZkNauBbNrRqm8tF0QC/jjSqfeM+QFLSYh/Wao6833A6hnvc7o2eDuUvgCguZmdwh2krBc1SBkpaVwzOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLp/MHL5laFvhTEMhWR3mUEYVlchWbqLLvWR8GQjy9M=;
 b=fYZ0sT+eAtreZjdAJyk2FjwyhSCeOkhO+Pr3rz7mdm+/by9J81pdiARpc7QRTYqLZF2qo+hb/ot4eDNSqDNeqTRA92vaELmoxLS2Mtj1Fw2UbypRZFKxcHaWgrD/ZUZuIA20nPJ3ckUBI/kpKlVeZ7gg6VE0xvEB9i23pFEiJ+2Gx7sj5SV0Zt1Q0kZy6EOC60f59XYZWBFxw0j51VSjmCQTIijNwBxZ8DTjrHe6zPSgeYh5+RCKY2oe9OK1bx8eyan8tUn5wqN96TUg8AE259S3S5shtdlBHSwWhPR6J808H3/+TgRIWWOlNG7DMoX/uP0QzlE7RCIb9E/4O0YaIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:24:45 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:24:45 +0000
From: Qi.Chen@windriver.com
To: docs@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com
Subject: [PATCH 1/3] ref-manual/classes.rst: add upstream-stable-release-point class documentation
Date: Sun, 14 Jun 2026 23:24:34 -0700
Message-ID: <20260615062438.3119651-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: a0796d3b-c4c6-435e-7cf3-08decaa6cafc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|18002099003|38350700014|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	xR6W0m5IJiWj1j83Yow6CatIBU64iYYDh5mErItFnHYcvQT+9Gl5kloBQd+zPFOBuTzJFcQIpUN85AxIKFBGfsGJvCZORcfBDIt3L7Mwu8tbS+fRHb/qi2K6HPUVxGUpBbXTpwVratjq8TmGuwEmpIcccQtvBXLErI39T26wbBBWWnIMFENPgTLPGUAvKq9uw0BNHUIZ+xPB3z00csvEZmbHbQYlsnHKHPxmsElIGtrbf2+c53A9FGqRLztS1glvCxPpV2xnQ9sdw4TczGE36xkInDTCMR7HecCqsoGKMfi5qTF73r6sHjLC7aLWsSZ4qLOSbIokgRiiwbtgP5iWGQFbMQzEVWhFmz8TejrfiML/cJq4KNIW5K3qx/Etxv2wRkNHq2vkX5PkowYeiVhDyQ5//rEIkqA7aczuf+1f2xyCAOZ4YSeT1NkmPDyj0DYTucSqOEs4bwaZGP8DluLu0hv0tIWkZBFeBP6ZtQ/8zBYUi6cRPaQW1QDKGtjh58jr2ulLR5GFZOCD80qem++WAEhI+kXCCg0BXnFS4jkHpSmHKNT6gkJJ17inuYpLqonizhC4aZa0HTVdOnfD/FVNNSZOtqIxoNgxcIbrvQIZWL1OlxdPCUiKCz6Dn/uDxoOqhtVoiB+p/TCzzk6VTMZV31cOss3MI2HJoFqhThMHG6c/UY7Op9acqd68FbZb7M/ldiFI55ooFvfDTyf85QRujfv+ID4zDkY8ucRau4Eov1NONDsjSNAXyjW1DzPyq4aQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(18002099003)(38350700014)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnB0YVpDdFdkVkVGclBQNFpTRklXQTQwMGxsZGtWV0ZoaFl3djc3MEljUExW?=
 =?utf-8?B?YjdOZDhGZzRyL0VMd05KSVVkRUduS1hZSVRHVUhBL0U2UGI3YnBkUGsyR3Ur?=
 =?utf-8?B?ampta0V5RHRDSmJScndtWkNPWHRXTXpRakZnRXRxcnQ0empqV1BuUm9NVS80?=
 =?utf-8?B?MUk0aVNKZDFtdzQzVzV1ZVRtK3RPaE1ReEtoZWo3ZWU1MUJ2bnRrTVNMaUp6?=
 =?utf-8?B?SEpzVUV1TlRZTm5HZ0pyS3RnVHpGYnNjT1Z3Zld4SjUyQWFOa3JFMVNnWGYz?=
 =?utf-8?B?cmJHZnVXa2huY3EwbHBvQSt1R21xZWg4NG9jcjBTNEY1dkx2b2dpZk1JcCtx?=
 =?utf-8?B?UHBkeW5QS1c4bWdNK292NkZ3SCtBemhCUWVzZEUzUVZrTUNFeThZUGpVQk1E?=
 =?utf-8?B?UHpZZDZqNmtOVnhzSmlaV2tyTThZVnJKOUFNdldHSWd6Uk1IYWVTTnVFV3dU?=
 =?utf-8?B?cnk1MFRUM0V6ck5DUmVoVE9ISmxUWitEMkxUOWxjeXExS2JMWUlhRlM5R0Rn?=
 =?utf-8?B?VEllZENjbEt6WDNaazMra2RZMW9iakY5OEY2eEV6djVhaHhDcmQvQVpvYlVx?=
 =?utf-8?B?ZHFXMXM0Sml2MVllVElhUzVRUWJnNFNaU0YxaWlKeWl4cmdTNlRCY0o1UUVi?=
 =?utf-8?B?cXljeEo4bVVhVlU5QTFEbkJrcWNJOHFhMkxsdkFQUk1va1lmaEJwdEdPZjBC?=
 =?utf-8?B?blZPOXFsK2w2MVJRVnRDUnM1MXJZNlpYd3ovNk9JcmRhMVg5MlR5ME1wQmRi?=
 =?utf-8?B?b3c1eEl5N2NuWldpN3lWdkx4Szg5Y3NrS21uaVEyYkZKeGtuYWtjRGhkN1U4?=
 =?utf-8?B?R04xSUtPcURqblU5dHAzWWJJRDl6TktrNEFyU1dlMGF5K1VWN3I2MWgyWE80?=
 =?utf-8?B?cEJTajFueXdUblZmb1lnUkNacWlLZXdkVTBYOUtHcENFeVRpR3hmaEZYZGxK?=
 =?utf-8?B?dkhEM1piNDBoZWxHNnEydVhySzNZeU1Vb0I0T2hxVHVKakZwREQ0V2xQVUda?=
 =?utf-8?B?amdYcSt3Yi9tUHR4QWFDMnJmTTk5cGtCa2RDK0hwRFpWU0N5Y1dNQXc5V2Jv?=
 =?utf-8?B?cWRMcU5QV2J6TE9haU9qb1h0MzRDWStmVEdLM28yc2dWejR5RHZPNDB4OHB0?=
 =?utf-8?B?c2FhbHRhZHdYcjFDVnF0cEhiMHFrbGdXOXRyUFRBVEhMcThLUVdvL3ppRHE5?=
 =?utf-8?B?UitySjBzQUxXS3EwRW8rTFkwRGVvZDFvOVdNZkFueFRlbFMwYmJiZWtPZ0ZF?=
 =?utf-8?B?aXdNYXVFSlZsVkJEWWNxNmNEc1FVanl5T3puYWFhem5OVjAyVHZGVTg2ODhn?=
 =?utf-8?B?QnVkckphWGQyNGZqMnNCN1JmUS9welIySkJ1LzF2ODlXcWVOb2RPU21NQUFZ?=
 =?utf-8?B?dmVMS3dHeWlkajNhSDhaVEcwM05GSFJYV0NSOXk4cldWZ0hpMml0MXFxeFJq?=
 =?utf-8?B?emIyeWJQc01iSHJNckNMaUtHaG5sOGs1aWl4T1VTZ0ZxU2E5L2h0NmU1TndK?=
 =?utf-8?B?Z1hVWU9IUWZ5dnVpZEU3TjdibTIxL1ViM25aVW5DaXk5TjVya1V5L0xyaGNt?=
 =?utf-8?B?UDJ0a09DdXA5NTlLVWRmWVA1YitqVUZmRUl5ZmdIeVJNN2tjYW8vWXpqaVV6?=
 =?utf-8?B?d2w5M0N5aTA4VkZuSVJCSHp0NDU5b1FEN2x1enRkQ0s0eitFZFltUWt3YWZm?=
 =?utf-8?B?SGVDZGNpS2NWbUdjaUd6eHE1clR0ZklVUitlc2JSbmVyVzd2ZExzdktMdVY3?=
 =?utf-8?B?L2NHUjU3cU5lMDQ1UFpKQUJYZ3ZJdnlPRWl5cE1semNyejF1YTB4RTBTN1Bs?=
 =?utf-8?B?WWhLNnZFUU5yK0Y5M3R3L0JEbGJnMnp2L3hrTEdIK2RyNkloNk5hY1FBd0hF?=
 =?utf-8?B?U3h2bWptZTZycE5FeDBSd0FqZ2pHUDVwQUtlb0FoM1ZobHlSOXNQQ0VnQnQz?=
 =?utf-8?B?ejEzMlBPVURqYU11WnRtWW1WZ2dFcitwUkUyUGtLSU5iVjV2aURmd1hoRzV3?=
 =?utf-8?B?OTU1cUN1K1p1QndBYmJOakdVcFZHQmNNNkJPbjdqdFd5OVYxMkVWd1lsM0FU?=
 =?utf-8?B?UzllOW5rK3dJRDlrRHdtR3VZemR2a0pEUmxBZnVUZGoxUGpYQkJ3MEEyRmNU?=
 =?utf-8?B?VVFUNGJ4UGhnZUFUUlNXNzRieldvZjR1RmpjV3k5Mk9CUzV6dG92WGRkc0hu?=
 =?utf-8?B?ci9ubXUxMUZKTkZqdjMvaGQxSndlWld2d01INXdTbHBpblArRVFOOUNwclU2?=
 =?utf-8?B?Skx1VVVMdFBxN29nUnQ2ME9OOC9wcWZ3bmovRU83WFBOT3B0em9odFYzVU5Q?=
 =?utf-8?B?MVppZTNuY1FNZ2VocGN5cjd6amNSS0xDWDFOV0NzL1hWdkdDZ08vdz09?=
X-Exchange-RoutingPolicyChecked: 
	frDRy7lrPFtXRDQhtGQt58gf0jIB068wcCRYTWp179+rAFqIcxLgZlGCEoUc+HIj9WB7g6TJj/qFfK0Ba4QDLlJWfViOLMo6mYD613yAaFxBJoMmmcdc7PCLvEcQTLQtlip4G2ZEaImXh0U5Xwf4SNervvaUREzp11Q4A7c9c1dbCtkJ03MO7OWsx1NZBEFHJ4VD1h8GCheSVLXgBY0iRjlKdk4J9dDRciQxd+cM6RaUTsRlBOZRkLpXPAHOFtVNqx/njx5LI6Zqlx3ug1YPw5Yu2w+R7KzevVJ+UFkAJzTl8ZODbDlK5Fid2ezcrVwctTQ/Xqd2v456gKrv9DfgCQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0796d3b-c4c6-435e-7cf3-08decaa6cafc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 06:24:45.3178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4PgsiB0rrFDMuJEgFOwgVMlNpwBvJ21pS51tC7dkbQj2YE81HtXHNnhMNVU0RRCecNKYbIoFM9N1X6ijGGWiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2NCBTYWx0ZWRfX3h+dzptasurr
 bwk9aBKBV216YcD74/noJk6ye4mOG1GnICq69GUJhicDKeVTJ2Uph1bCloEhhQ88yfNffiIhEbg
 aiX5Pw/zvJE+Y10QnFkX8drx1Sk0PyShocxIiXAaz9BuNAeeh1d9ubxmJWYRfbIqVb5lWS9S/S0
 NZ4lbtejZi9bIMJwtbZcWfT3Pq4Yi0qN22ylV8ARevpGgqi1dzfqysoijPeu8ElzS6ObnSTbi4B
 wxFJR2Hx3abWMWzuv+R2K+A3UcDuAKrug5g/NtO7XiDML9+kexn6GRPe64CkzbVYkTzWx/TkDs2
 E465dVL7Ouwe+f5wjSI+tKeXemBhw91LOt7AdTI2bEqj3hmJXhs4zpqMSDbzhaVHILsxdFEqmMJ
 T2jRKJssVRMqOIbbdLSVmvpe5CWWZnR46guydSXvz25iQDLR/jiQ7g7BvEaAdp9pROJ8y9bN/vF
 wcBjeReGAkresIFonZg==
X-Authority-Analysis: v=2.4 cv=BK+DalQG c=1 sm=1 tr=0 ts=6a2f9ab0 cx=c_pps
 a=OAmo50eV21M7Ophgg7+Z+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=t7CeM3EgAAAA:8 a=ljOHmGDoImW_DtJpQMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2NCBTYWx0ZWRfXy90THyc04Oko
 3/4MPIUjQZifv2Z0N0N0uMHjSEy+PD7F7DHJXP1UmpzVjiQE+WG/gXcCikFJx/2mS4iDEi7GHM4
 X5KdoCCnB17ifIyA26C2rh4tPGiBoVrdYLgAo0OrR70dq2Z1SfUw
X-Proofpoint-GUID: lpLO38Vkp_pKm56Tx9b5gHHkrWNOW8bl
X-Proofpoint-ORIG-GUID: lpLO38Vkp_pKm56Tx9b5gHHkrWNOW8bl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65F6Ntvk216469
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 06:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9715

From: Chen Qi <Qi.Chen@windriver.com>

Document the upstream-stable-release-point bbclass which automatically
generates UPSTREAM_STABLE_RELEASE_REGEX for recipes with dot-separated
version schemes, enabling stable point release upgrades.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 documentation/ref-manual/classes.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index 95e07f85a..f0d9b1d55 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3655,6 +3655,30 @@ Three variables control this class: :term:`INITSCR=
IPT_PACKAGES`,
 :term:`INITSCRIPT_NAME` and :term:`INITSCRIPT_PARAMS`. See the variable =
links
 for details.
=20
+.. _ref-classes-upstream-stable-release-point:
+
+``upstream-stable-release-point``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The :ref:`ref-classes-upstream-stable-release-point` class automatically
+generates the :term:`UPSTREAM_STABLE_RELEASE_REGEX` variable for recipes
+whose version uses a dot-separated scheme. This enables stable point rel=
ease
+upgrades =E2=80=94 version upgrades constrained to the same stable serie=
s (e.g.
+``1.4.2`` to ``1.4.3`` but not to ``1.5.0``).
+
+The class uses the :term:`STABLE_VERSION_PARTS` variable (defaults to ``=
"2"``)
+to determine how many leading dot-separated parts of :term:`PV` constitu=
te the
+stable prefix. For example:
+
+-  With ``PV =3D "1.4.2"`` and ``STABLE_VERSION_PARTS =3D "2"`` (default=
), the
+   generated regex is ``^1\.4(\.\d+)*$``.
+-  With ``PV =3D "259.5"`` and ``STABLE_VERSION_PARTS =3D "1"`` (e.g. sy=
stemd), the
+   generated regex is ``^259(\.\d+)*$``.
+
+For recipes whose stable version part is not dot-separated (e.g. openssh=
 uses
+``10.2p1``), set :term:`UPSTREAM_STABLE_RELEASE_REGEX` directly instead =
of
+inheriting this class.
+
 .. _ref-classes-useradd:
=20
 ``useradd*``
--=20
2.54.0


