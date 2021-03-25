<table class="table table-condensed table-striped table-bordered">
	<thead>
		<tr>
			<th>Task</th>
			<th>File</th>
			<th>Interval</th>
			<th>Timeout</th>
			<th>Start Time</th>
			<th>Start Date</th>
		</tr>
	</thead>
	<tbody>
		<tr v-for="tsk in tasks">
			<td>{{ tsk.task }}</td>
			<td>{{ tsk.file }}</td>
			<td>{{ tsk.interval }}</td>
			<td>{{ tsk.timeout }}</td>
			<td>{{ tsk.starttime | moment('h:mm:ss a') }}</td>
			<td>{{ tsk.startdate | moment('yyyy-MM-DD') }}</td>
		</tr>
	</tbody>
</table>